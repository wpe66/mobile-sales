package net.walterpenschke.mobilesales.service;

import net.walterpenschke.mobilesales.model.PostalAddress;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PostalAdressService {

    private static final PostalAddress ADDRESS_1 = new PostalAddress(1,
            "Bahnhofsalle 8",
            "61231",
            "Bad Nauheim",
            "Deutschland");
    private static final PostalAddress ADDRESS_2 = new PostalAddress(2,
            "Elbestraße 7",
            "61278",
            "Nieder Wöllstadt",
            "Deutschland");


    public List<PostalAddress> getAllPostalAddresses() {
        List<PostalAddress> addressList = new ArrayList<>();


        addressList.add(ADDRESS_1);
        addressList.add(ADDRESS_2);

        return addressList;
    }

    public PostalAddress  getPostalAddress(long id) {
        if (id == 1) {
            return ADDRESS_1;

        }

        if (id == 2) {
            return  ADDRESS_2;
        }

        return null;
    }


}
