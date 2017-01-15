package controllers;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import daos.ProductDAO;
import models.Product;

@Controller
@Transactional
public class ProductsController {
	
	@Autowired
	private ProductDAO productDAO;

//	
//	public String save(Product product) {
//		System.out.println("Cadastrando produto " + product);
//		return "products/ok";
//	}

	@RequestMapping("/products/form")
	public String form() {
		return "products/form";
	}

	@RequestMapping("/produtos")
	public String save(Product product) {
		this.productDAO.save(product);
		return "products/ok";
	}
}
