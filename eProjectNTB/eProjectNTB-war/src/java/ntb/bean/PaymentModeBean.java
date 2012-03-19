/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ntb.bean;

import BeanCRUD.ContractsFacade;
import BeanCRUD.PaymentModesFacade;
import BeanInfo.Contracts;
import BeanInfo.PaymentModes;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;

/**
 *
 * @author phamdoan
 */
public class PaymentModeBean {

    @EJB
    private ContractsFacade contractsFacade;
    @EJB
    private PaymentModesFacade paymentModesFacade;
    private PaymentModes paymentMode = new PaymentModes();
    private Contracts contract = new Contracts();
    private int errors = 1;

    /** Creates a new instance of PaymentModeBean */
    public PaymentModeBean() {
    }

    //get add date payment mode
    public List<PaymentModes> getListPaymentMode() {
        return this.paymentModesFacade.findAll();
    }

    public List<Contracts> getListContract() {
        return this.contractsFacade.findAll();
    }
    //function install data onto the table Payment Mode in the database
    public void createPaymentMode() {
        String rn = paymentMode.getPaymentModeName();
        List<PaymentModes> temp = getListPaymentMode();
        for (int i = 0; i < temp.size(); i++) {
            if (rn.equals(temp.get(i).getPaymentModeName())) {
                this.errors = 1;
                System.out.println("error :");
                break;
            } else {
                this.errors = 0;
            }
        }
        if (errors == 1) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "payment mode '" + paymentMode.getPaymentModeName() + "' existed. Can't insert!!!");
        } else {
            this.paymentModesFacade.create(getPaymentMode());
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "New payment mode '" + getPaymentMode().getPaymentModeName()
                    + "' have been created successully", "Finish!");
            this.setErrors(0);

        }
    }

    public void updatePaymentMode() {
        this.paymentMode.setPaymentModeID(Integer.parseInt(ThaoTacSession.layXuong("paymentModeID").toString()));


        this.getPaymentMode().setPaymentModeID(Integer.parseInt(ThaoTacSession.layXuong("paymentModeID").toString()));
        ThaoTacSession.xoaGT("paymentModeID");
        this.paymentModesFacade.edit(getPaymentMode());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "The payment mode '" + getPaymentMode().getPaymentModeName() + "' updated successfully", "Finish!");
        this.setErrors(0);
    }
    
    //function deltete data onto the table Payment Mode in the database
    public void deletePaymentMode() {
        int id = Integer.parseInt(ThaoTacSession.layXuong("paymentModeID").toString());
        paymentMode = this.paymentModesFacade.find(id);
        List<Contracts> temp = this.getListContract();
        for (int i = 0; i < temp.size(); i++) {
            if (id == temp.get(i).getPaymentModes().getPaymentModeID()) {
                this.errors = 1;
                break;
            } else {
                this.errors = 0;
            }
        }
        if (errors == 1) {
            Messages.taoTB(FacesMessage.SEVERITY_ERROR, "", "Contract '" + getPaymentMode().getPaymentModeName() + "' is existing in child table. ");
        } else {
            this.paymentModesFacade.deletePaymentMode(Integer.parseInt(ThaoTacSession.layXuong("paymentModeID").toString()));
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted payment mode'" + getPaymentMode().getPaymentModeName() + "'", "Finish!");
            this.setErrors(0);
        }
        ThaoTacSession.xoaGT("paymentModeID");
    }

    public void setPaymentModeToSession() {
        ThaoTacSession.duaGTLenSession("paymentMode", this.paymentMode);
        System.out.println("thao tac lay xong" + paymentMode);
    }

    public void setPaymentModeIDToSession() {
        ThaoTacSession.duaGTLenSession("paymentModeID", this.paymentMode.getPaymentModeID());
        System.out.println("thao tac session " + paymentMode);
    }

    /**
     * @return the paymentMode
     */
    public PaymentModes getPaymentMode() {
        return paymentMode;
    }

    /**
     * @param paymentMode the paymentMode to set
     */
    public void setPaymentMode(PaymentModes paymentMode) {
        this.paymentMode = paymentMode;
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
}
