/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project;

/**
 *
 * @author Fitri Zaini
 */
public class lokasi {
    
    private int lokasiId,kuotaProv,totalmasjid;

    public int getTotalmasjid() {
        return totalmasjid;
    }

    public void setTotalmasjid(int totalmasjid) {
        this.totalmasjid = totalmasjid;
    }
    private String pjaId,namaMasjid,latitude,longitude,poskod,kuodate,daerah,mukim,gamMasjid;

    public String getDaerah() {
        return daerah;
    }

    public void setDaerah(String daerah) {
        this.daerah = daerah;
    }

    public String getMukim() {
        return mukim;
    }

    public void setMukim(String mukim) {
        this.mukim = mukim;
    }

   
    public String getKuodate() {
        return kuodate;
    }

    public void setKuodate(String kuodate) {
        this.kuodate = kuodate;
    }

    public int getKuotaProv() {
        return kuotaProv;
    }

    public void setKuotaProv(int kuotaProv) {
        this.kuotaProv = kuotaProv;
    }

    public String getPjaId() {
        return pjaId;
    }

    public void setPjaId(String pjaId) {
        this.pjaId = pjaId;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public int getLokasiId() {
        return lokasiId;
    }

    public void setLokasiId(int lokasiId) {
        this.lokasiId = lokasiId;
    }

    
    public String getNamaMasjid() {
        return namaMasjid;
    }

    public void setNamaMasjid(String namaMasjid) {
        this.namaMasjid = namaMasjid;
    }

    public String getPoskod() {
        return poskod;
    }

    public void setPoskod(String poskod) {
        this.poskod = poskod;
    }

    public String getGamMasjid() {
        return gamMasjid;
    }

    public void setGamMasjid(String gamMasjid) {
        this.gamMasjid = gamMasjid;
    }
}
