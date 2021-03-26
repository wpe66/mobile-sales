package net.walterpenschke.mobilesales.controller;

import net.walterpenschke.mobilesales.model.PostalAddress;
import net.walterpenschke.mobilesales.service.PostalAdressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class PostalAddressController {

    @Autowired
    private PostalAdressService postalAdressService;


    public PostalAddressController(PostalAdressService postalAdressService) {
        this.postalAdressService = postalAdressService;
    }

    // ----------------
    //  Business Logic
    // ----------------

    @GetMapping("/PostalAddress")
    public List<PostalAddress> getAllPostalAddresses() {
        return postalAdressService.getAllPostalAddresses();
    }

    @GetMapping("/PostalAddress/{id}")
    public PostalAddress  getPostalAddress(@PathVariable long id) {
        return postalAdressService.getPostalAddress(id);
    }

}
