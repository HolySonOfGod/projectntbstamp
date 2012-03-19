/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author phamdoan
 */
package ntb.bean;

import BeanCRUD.AccountsFacade;
import BeanCRUD.ArticlesFacade;
import BeanCRUD.BuildingsFacade;
import BeanCRUD.ContractsFacade;
import BeanCRUD.PaymentDetailsFacade;
import BeanCRUD.PaymentModesFacade;
import BeanInfo.Accounts;
import BeanInfo.Articles;
import BeanInfo.Buildings;
import BeanInfo.Contracts;
import BeanInfo.PaymentDetails;
import BeanInfo.PaymentModes;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.persistence.PrePersist;

/**
 *
 * @author phamdoan
 */
public final class PaymentDetailBean {

    @EJB
    private ArticlesFacade articlesFacade;
    @EJB
    private BuildingsFacade buildingsFacade;
    @EJB
    private AccountsFacade accountsFacade;
    @EJB
    private PaymentModesFacade paymentModesFacade;
    @EJB
    private ContractsFacade contractsFacade;
    @EJB
    private PaymentDetailsFacade paymentDetailsFacade;
    private PaymentDetails paymentDetail = new PaymentDetails();
    private Contracts contract = new Contracts();
    private PaymentModes paymentmode = new PaymentModes();
    private Accounts account = new Accounts();
    private Buildings building = new Buildings();
    private Articles articles = new Articles();
    private int errors = 1;
    private int contractID = 1;
    private String strDate;
    private int sumContract;
    private double totalCost;
    private int installment;
    private double interest;
    private double amountPaidPerInstallment;
    private String username;
    private double amountpaid;
    private String paymentname;
    private double firstPaid;
    private double amountOweb;
    private double otherCost = 0;

    public double getAmountOweb() {
        return amountOweb;
    }

    public void setAmountOweb(double amountOweb) {
        this.amountOweb = amountOweb;
    }

    public int getInstallment() {
        return installment;
    }

    public void setInstallment(int installment) {
        this.installment = installment;
    }

    public double getInterest() {
        return interest;
    }

    public void setInterest(double interest) {
        this.interest = interest;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public int getSumContract() {
        return sumContract;
    }

    public void setSumContract(int sumContract) {
        this.sumContract = sumContract;
    }

    /** Creates a new instance of PaymentDetailBean */
    public PaymentDetailBean() {
    }

    public List<PaymentDetails> getListPaymentDetail() {

        return this.paymentDetailsFacade.findAll();
    }

    public List<SelectItem> getListContractID() {
        List<SelectItem> temp = new ArrayList<SelectItem>();
        List<Contracts> list = this.contractsFacade.findAll();
        for (Contracts c : list) {
            if (!c.getPaymentModes().getPaymentModeName().equals("one time"))
            {
                SelectItem si = new SelectItem(c.getContractID(), c.getContractID().toString());
                temp.add(si);
            }
        }
        return temp;
    }

    public List<SelectItem> getListAccount() {
        List<SelectItem> temp = new ArrayList<SelectItem>();
        List<Accounts> list = this.accountsFacade.findAll();
        for (Accounts a : list) {
            SelectItem si = new SelectItem(a.getUsername(), a.getUsername());
            temp.add(si);
        }
        return temp;
    }

    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }
    private int installmentNo;

    public int getInstallmentNo() {
        return installmentNo;
    }

    public void setInstallmentNo(int installmentNo) {
        this.installmentNo = installmentNo;
    }

    //function calculating auto payment detail
    @PrePersist
    public void onchanger() {
        contract = this.contractsFacade.find(this.contractID);
        try {
            List<PaymentDetails> pdList = this.paymentDetailsFacade.getPaymentOfContract(contract);
            if (pdList.isEmpty() || pdList == null) {
                this.installmentNo = 1;
            } else {
                this.installmentNo = pdList.size() + 1;
            }
        } catch (Exception e) {
            this.installmentNo = 1;
        }
        this.username = contract.getAccounts().getUsername();
        this.paymentname = contract.getPaymentModes().getPaymentModeName();
        this.totalCost = contract.getTotalCost();
        this.installment = contract.getPaymentModes().getInstallment();
        this.amountPaidPerInstallment = (double) totalCost / installment;
        BigDecimal bd = new BigDecimal(this.amountPaidPerInstallment);
        bd = bd.setScale(2, BigDecimal.ROUND_HALF_UP);
        this.amountPaidPerInstallment = bd.doubleValue();
        this.amountpaid = this.amountPaidPerInstallment * this.installmentNo;
        this.amountOweb = this.totalCost - this.firstPaid - (this.amountPaidPerInstallment * this.installmentNo);
        FacesContext.getCurrentInstance().renderResponse();
    }

    //funcition install date on datebase
    @PrePersist
    public void createPaymentDetail() {
        try {
            if (installmentNo <= installment) {
                Date d = new Date();
                this.paymentDetail.setPayDate(d);
                this.paymentDetail.setAmountPaidPerInstallment(amountPaidPerInstallment);
                this.paymentDetail.setAmountPaid(amountpaid);
                this.paymentDetail.setAmountOwed(amountOweb);
                this.paymentDetail.setContracts(contract);
                this.paymentDetail.setInstallmentNo(installmentNo);
                this.paymentDetail.setOtherCost(otherCost);
                this.paymentDetailsFacade.create(this.paymentDetail);
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "New payment details have been created successully", "Finish!");
                this.setErrors(0);
            } else {
                Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "payment contract ends, you can't install new  ");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    /**
    public void updatePaymentDetail() {
    Date d = new Date();
    this.paymentDetail.setPayDate(d);
    this.getPaymentDetail().setPaymentDetailID(Integer.parseInt(ThaoTacSession.layXuong("paymentDetailID").toString()));
    Integer i = (Integer) ThaoTacSession.layXuong("paymentDetailID");
    System.out.println("lay xuong" + i.toString());
    Contracts cTemp = this.contractsFacade.find(contractID);
    this.paymentDetail.setContracts(cTemp);
    this.paymentDetailsFacade.edit(paymentDetail);
    Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "The payment Detail '" + getPaymentDetail().getPayDate() + "' updated successfully. Finish!");
    this.setErrors(0);
    ThaoTacSession.xoaGT("paymentDetailID");
    }
     **/
    public void deletePaymentDetail() {
        this.paymentDetailsFacade.deletePaymentDetailID(Integer.parseInt(ThaoTacSession.layXuong("paymentDetailID").toString()));
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted payment detail'" + "'", "Finish!");
        this.setErrors(0);
    }

    public void setPaymentDetailToSession() {
        ThaoTacSession.duaGTLenSession("PaymentDetail", this.paymentDetail);
    }

    public void setPaymentDetailIDToSession() {
        ThaoTacSession.duaGTLenSession("paymentDetailID", this.paymentDetail.getPaymentDetailID());
        System.out.println(" dua len ID :" + this.paymentDetail.getPaymentDetailID().toString());
    }

    /**
     * @return the paymentDetail
     */
    public PaymentDetails getPaymentDetail() {
        return paymentDetail;
    }

    /**
     * @param paymentDetail the paymentDetail to set
     */
    public void setPaymentDetail(PaymentDetails paymentDetail) {
        this.paymentDetail = paymentDetail;
    }

    /**
     * @return the errors
     */
    public int getErrors() {
        return errors;
    }

    /**
     * @param errors the errors to set
     */
    public void setErrors(int errors) {
        this.errors = errors;
    }

    /**
     * @return the contract
     */
    public Contracts getContract() {
        return contract;
    }

    /**
     * @param contract the contract to set
     */
    public void setContract(Contracts contract) {
        this.contract = contract;
    }

    /**
     * @return the strDate
     */
    public String getStrDate() {
        return strDate;
    }

    /**
     * @param strDate the strDate to set
     */
    public void setStrDate(String strDate) {
        this.strDate = strDate;
    }

    /**
     * @return the paymentmode
     */
    public PaymentModes getPaymentmode() {
        return paymentmode;
    }

    /**
     * @param paymentmode the paymentmode to set
     */
    public void setPaymentmode(PaymentModes paymentmode) {
        this.paymentmode = paymentmode;
    }

    /**
     * @return the amountPaidPerInstallment
     */
    public double getAmountPaidPerInstallment() {
        return amountPaidPerInstallment;
    }

    /**
     * @param amountPaidPerInstallment the amountPaidPerInstallment to set
     */
    public void setAmountPaidPerInstallment(double amountPaidPerInstallment) {
        this.amountPaidPerInstallment = amountPaidPerInstallment;
    }

    /**
     * @return the account
     */
    public Accounts getAccount() {
        return account;
    }

    /**
     * @param account the account to set
     */
    public void setAccount(Accounts account) {
        this.account = account;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the amountpaid
     */
    public double getAmountpaid() {
        return amountpaid;
    }

    /**
     * @param amountpaid the amountpaid to set
     */
    public void setAmountpaid(double amountpaid) {
        this.amountpaid = amountpaid;
    }

    /**
     * @return the paymentname
     */
    public String getPaymentname() {
        return paymentname;
    }

    /**
     * @param paymentname the paymentname to set
     */
    public void setPaymentname(String paymentname) {
        this.paymentname = paymentname;
    }

    /**
     * @return the firstPaid
     */
    public double getFirstPaid() {
        return firstPaid;
    }

    /**
     * @param firstPaid the firstPaid to set
     */
    public void setFirstPaid(double firstPaid) {
        this.firstPaid = firstPaid;
    }

    /**
     * @return the building
     */
    public Buildings getBuilding() {
        return building;
    }

    /**
     * @param building the building to set
     */
    public void setBuilding(Buildings building) {
        this.building = building;
    }

    /**
     * @return the articles
     */
    public Articles getArticles() {
        return articles;
    }

    /**
     * @param articles the articles to set
     */
    public void setArticles(Articles articles) {
        this.articles = articles;
    }

    /**
     * @return the otherCost
     */
    public double getOtherCost() {
        return otherCost;
    }

    /**
     * @param otherCost the otherCost to set
     */
    public void setOtherCost(double otherCost) {
        this.otherCost = otherCost;
    }
}
