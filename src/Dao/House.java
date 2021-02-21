package Dao;

public class House {

    private String town;
    private Float price;
    private Float area;
    private String houseType;
    private String location;
    private Float growth;
    private Float historyPrice;
    private String district;
    private Float forecast;

    public House() {
    }

    public House(String town, Float price, Float area, String houseType, String location, Float growth, Float historyPrice, String district, Float forecast) {
        this.town = town;
        this.price = price;
        this.area = area;
        this.houseType = houseType;
        this.location = location;
        this.growth = growth;
        this.historyPrice = historyPrice;
        this.district = district;
        this.forecast = forecast;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getArea() {
        return area;
    }

    public void setArea(Float area) {
        this.area = area;
    }

    public String getHouseType() {
        return houseType;
    }

    public void setHouseType(String houseType) {
        this.houseType = houseType;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Float getGrowth() {
        return growth;
    }

    public void setGrowth(Float growth) {
        this.growth = growth;
    }

    public Float getHistoryPrice() {
        return historyPrice;
    }

    public void setHistoryPrice(Float historyPrice) {
        this.historyPrice = historyPrice;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public Float getForecast() {
        return forecast;
    }

    public void setForecast(Float forecast) {
        this.forecast = forecast;
    }
}
