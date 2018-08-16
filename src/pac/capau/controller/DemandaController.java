package pac.capau.controller;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Transactional
@Controller
@RequestMapping("/demanda")
public class DemandaController {

	@RequestMapping("/nova")
	public String novaDemanda(Model model) {
		return "demanda/novo";
	}

}
