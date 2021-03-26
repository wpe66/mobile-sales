package net.walterpenschke.mobilesales.model;

/**
 * Immutable PostalAddress.
 *
 * @author wpe
 * @since 2021-03-26
 */
public class PostalAddress {

    private final long id;
    private final String street;
    private final String postalCode;
    private final String city;
    private final String country;



    public PostalAddress(long id, String street, String postalCode, String city, String country) {
        this.id = id;
        this.street = street;
        this.postalCode = postalCode;
        this.city = city;
        this.country = country;
    }

    public long getId() {
        return id;
    }

    public String getStreet() {
        return street;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public String getCity() {
        return city;
    }

    public String getCountry() {
        return country;
    }


}
