/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ntb.bean;
import BeanCRUD.ApartmentsFacade;
import BeanCRUD.BuildingsFacade;
import BeanCRUD.FloorsFacade;
import BeanCRUD.ImageListsFacade;
import BeanInfo.Apartments;
import BeanInfo.Buildings;
import BeanInfo.Floors;
import BeanInfo.ImageLists;
import Helpers.Messages;
import Helpers.ThaoTacSession;
import Helpers.hinhPhoto;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import org.richfaces.event.UploadEvent;
import org.richfaces.model.UploadItem;

/**
 *
 * @author NguyenQuocHung
 */
public class ImageListBean {
    @EJB
    private BuildingsFacade buildingsFacade;
    private Buildings building=new Buildings();
    @EJB
    private FloorsFacade floorsFacade;
    private Floors floor= new Floors();
    @EJB
    private ApartmentsFacade apartmentsFacade;
    private Apartments apartment = new Apartments();
    @EJB
    private ImageListsFacade imageListsFacade;
    private ImageLists imageList = new ImageLists();
    private int errors = 1;
    private int buildingID;

    public int getApartmentID() {
        return apartmentID;
    }

    public void setApartmentID(int apartmentID) {
        this.apartmentID = apartmentID;
    }

    public int getBuildingID() {
        return buildingID;
    }

    public void setBuildingID(int buildingID) {
        this.buildingID = buildingID;
    }

    public int getFloorID() {
        return floorID;
    }

    public void setFloorID(int floorID) {
        this.floorID = floorID;
    }
    private int floorID;
    private int apartmentID;
    /** Creates a new instance of ImageListBean */
    public ImageListBean() {
    }

    // get all images list
    public List<ImageLists> getListImageList() {
        return this.imageListsFacade.findAll();
    }

    //get a list of building to show in a combobox
     public List<SelectItem> getListBuildingName() {
        List<SelectItem>buildingItemList = new ArrayList<SelectItem>();
        List<Buildings> list = this.buildingsFacade.findAll();
        for (Buildings b : list) {
            SelectItem item = new SelectItem(b.getBuildingID(),b.getBuildingName());
            buildingItemList.add(item);
        }
        return buildingItemList;
    }

     /**Get a list of Floor show in a combobox*/
    public List<SelectItem> getListFloorNumber() {
        List<SelectItem>floorItemList = new ArrayList<SelectItem>();
        List<Floors> list = this.floorsFacade.getFloorOfBuilding(building);
        for (Floors f : list) {
            SelectItem item = new SelectItem(f.getFloorID(),String.valueOf(f.getFloorNumber()));
            floorItemList.add(item);
        }
        return floorItemList;
    }

    /**Get a list of apartment type show in a combobox*/
    public List<SelectItem> getListApartment() {
        List<SelectItem> apartmentList = new ArrayList<SelectItem>();
        List<Apartments> list = this.apartmentsFacade.getApartmentOfFloor(floor);
        for (Apartments a : list) {
            SelectItem item = new SelectItem(a.getApartmentID(),a.getApartmentID().toString());
            apartmentList.add(item);
        }
        return apartmentList;
    }

    //set building and rerender the floor combobox
    public void buildingChanged(){
        building = this.buildingsFacade.find(this.buildingID);
        FacesContext.getCurrentInstance().renderResponse();
    }

    //set floor and rerender the apartment combobox
      public void floorChanged(){
       floor = this.floorsFacade.find(this.floorID);
       FacesContext.getCurrentInstance().renderResponse();
    }


    //upload event - get image data to handle
    public void listener(UploadEvent e) {
        UploadItem item = (UploadItem) e.getUploadItem();
        if (item.getFileName() == null) {
            return;
        }
        hinhPhoto hinh = new hinhPhoto(item.getFileName(), item.getData());
        ThaoTacSession.duaGTLenSession("IMG", hinh);
    }

    //copy image
    private void copyHinh(String duongDan) throws IOException {
        hinhPhoto hinh = (hinhPhoto) ThaoTacSession.layXuong("IMG");
        String duongdanhhinh = duongDan + "/" + hinh.getTenHinh();
        File hinh1 = new File(duongdanhhinh);
        System.out.println("duong dan " + duongdanhhinh);
        hinh1.createNewFile();
        FileOutputStream fo = new FileOutputStream(hinh1);
        System.out.println("Truoc khi get du lieu");
        fo.write(hinh.getDuLieu());
        System.out.println("sau khi get du lieu");
        fo.flush();
        fo.close();
    }

    //upload image
    private void upHinhLenHost(String duongdan) throws IOException {
        hinhPhoto hinh = (hinhPhoto) ThaoTacSession.layXuong("IMG");
        String duongdanhhinh = duongdan + "/" + hinh.getTenHinh();
        File hinh1 = new File(duongdanhhinh);
        System.out.println("duong dan " + duongdanhhinh);
        hinh1.createNewFile();
        FileOutputStream fo = new FileOutputStream(hinh1);
        System.out.println("Truoc khi get du lieu");
        fo.write(hinh.getDuLieu());
        System.out.println("sau khi get du lieu");
        fo.flush();
        fo.close();
    }

    //mehod for inserting
    public void createImageList() throws FileNotFoundException, IOException {
         //get image from session and set image into imageList Object
        hinhPhoto img = (hinhPhoto) ThaoTacSession.layXuong("IMG");
        if (img != null){
        imageList.setImageList("images/upload/" + img.getTenHinh());

        //write the image into the folder
        String duongdan = ThaoTacSession.layDuongDan("user");
        duongdan = duongdan + "/images/upload";
        this.upHinhLenHost(duongdan);
        this.copyHinh("C:/Documents and Settings/Administrator/Desktop/Source Code/eProjectNTB/eProjectNTB-war/web/user/images/upload");

        apartment.setApartmentID(apartmentID);
        this.imageList.setApartments(apartment);
        this.imageListsFacade.create(getImageList());
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "New image list have been created successully", "Finish!");
        FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("ImageListBC");
        this.setErrors(0);}
        else{
            Messages.taoTB(FacesMessage.SEVERITY_INFO, "", "You have to upload an image");
        }
    }

    //method for deleting
    public void deleteImageList() {
        int listID= Integer.valueOf(ThaoTacSession.layXuong("listID").toString());
        this.imageListsFacade.deleteImage(listID);
        Messages.taoTB(FacesMessage.SEVERITY_INFO, "You deleted the image", "Finish!");
        this.setErrors(0);
    }

    public void setImageListToSession() {
        ThaoTacSession.duaGTLenSession("imageList", this.imageList);
    }

    public void setImageListIDToSession() {
        ThaoTacSession.duaGTLenSession("listID", this.imageList.getListID());
    }

    /**
     * @return the imageList
     */
    public ImageLists getImageList() {
        return imageList;
    }

    /**
     * @param imageList the imageList to set
     */
    public void setImageList(ImageLists imageList) {
        this.imageList = imageList;
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

}
