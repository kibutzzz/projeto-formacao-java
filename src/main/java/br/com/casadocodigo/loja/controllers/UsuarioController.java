package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.RoleDAO;
import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.Usuario;
import br.com.casadocodigo.loja.validation.UsuarioValidation;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioDAO usuarioDao;

	@Autowired
	private RoleDAO roleDao;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new UsuarioValidation());
	}

	@RequestMapping
	public ModelAndView listarUsuarios() {
		ModelAndView modelAndView = new ModelAndView("/usuario/lista");

		List<Usuario> usuarios = usuarioDao.listarUsuarios();

		modelAndView.addObject("usuarios", usuarios);

		return modelAndView;
	}

	@RequestMapping("/form")
	public ModelAndView cadastrarNovoUsuario(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("/usuario/form");

		return modelAndView;
	}

	@RequestMapping(value = "/cadastrar-usuario", method = RequestMethod.POST)
	public ModelAndView gravar(@Valid Usuario usuario, BindingResult result, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios");

		if (result.hasErrors()) {
			return cadastrarNovoUsuario(usuario);
		}

		try {
			String senhaCriptografada = new BCryptPasswordEncoder().encode(usuario.getSenha());
			usuario.setSenha(senhaCriptografada);
			usuarioDao.gravar(usuario);
		} catch (DataIntegrityViolationException e) {
			result.rejectValue("email", "field.required.email.taken");
			return cadastrarNovoUsuario(usuario);
		}

		redirectAttributes.addFlashAttribute("sucesso", "Usuario cadastrado com sucesso!");

		return modelAndView;
	}

	@RequestMapping("/editar")
	public ModelAndView editar(String email) {
		ModelAndView modelAndView = new ModelAndView("usuario/editar");

		Usuario usuario = usuarioDao.loadUserByUsername(email);
		modelAndView.addObject("usuario", usuario);

		List<Role> roles = roleDao.buscarRolesCadastradas();
		modelAndView.addObject("roles", roles);

		return modelAndView;
	}

	@RequestMapping(value = "/atualizar", method = RequestMethod.POST)
	public ModelAndView atualizarRole(Usuario usuario, RedirectAttributes redirectAttributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios");

		usuarioDao.gravarRoles(usuario);
		redirectAttributes.addFlashAttribute("atualizado", "permissões alteradas com sucesso");
		return modelAndView;
	}
}
