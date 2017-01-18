package controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import daos.ProductDAO;
import models.BookType;
import models.Product;
import validation.ProductValidator;

@Controller
@Transactional
@RequestMapping("/products")
public class ProductsController {

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new ProductValidator());
	}

	@Autowired
	private ProductDAO productDAO;

	//
	// public String save(Product product) {
	// System.out.println("Cadastrando produto " + product);
	// return "products/ok";
	// }

	// @RequestMapping("/products/form")
	// public String form() {
	// return "products/form";
	// }

	@RequestMapping(method = RequestMethod.POST,name="saveProduct")
	public ModelAndView save(@Valid Product product, BindingResult bindingResult,
			RedirectAttributes redirectAttributes) {
		if (bindingResult.hasErrors()) {
			return form();
		}
		productDAO.save(product);
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso");
		return new ModelAndView("redirect:produtos");
	}

	@RequestMapping("/form")
	public ModelAndView form() {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDAO.list());
		return modelAndView;
	}
}
