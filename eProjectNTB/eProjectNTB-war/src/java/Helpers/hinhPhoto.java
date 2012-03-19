/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package Helpers;

/**
 *
 * @author PeHa
 */
public class hinhPhoto {
    private String tenHinh;
    private byte[] duLieu;
    private String moTa;
    private String mime;

    public hinhPhoto(){
        
    }

    public hinhPhoto(String tenHinh, byte[] duLieu) {
        this.tenHinh = tenHinh;
        this.duLieu = duLieu;
    }

    /**
     * @return the tenHinh
     */
    public String getTenHinh() {
        return tenHinh;
    }

    /**
     * @param tenHinh the tenHinh to set
     */

    public void setTenHinh(String tenHinh) {
        this.tenHinh = tenHinh;
        int extDot = tenHinh.lastIndexOf('.');
        if(extDot > 0){
            String extension = tenHinh.substring(extDot +1);
            if("bmp".equals(extension)){
                mime="image/bmp";
            } else if("jpg".equals(extension)||"jpeg".equals(extension)){
                mime="image/jpeg";
            } else if("gif".equals(extension)){
                mime="image/gif";
            } else if("png".equals(extension)){
                mime="image/png";
            } else {
                mime = "image/unknown";
            }
        }
    }

    /**
     * @return the duLieu
     */
    public byte[] getDuLieu() {
        return duLieu;
    }

    /**
     * @param duLieu the duLieu to set
     */
    public void setDuLieu(byte[] duLieu) {
        this.duLieu = duLieu;
    }

    /**
     * @return the moTa
     */
    public String getMoTa() {
        return moTa;
    }

    /**
     * @param moTa the moTa to set
     */
    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    /**
     * @return the mime
     */
    public String getMime() {
        return mime;
    }

    /**
     * @param mime the mime to set
     */
    public void setMime(String mime) {
        this.mime = mime;
    }

}
