package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.loginSystem.RoleRepository;
import pl.coderslab.loginSystem.User;
import pl.coderslab.loginSystem.UserRepository;
import pl.coderslab.loginSystem.UserService;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/admins")
public class AuthorityAdminAdminsController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;


    @GetMapping
    String showAllAdmins(Model model) {
        model.addAttribute("admins", userRepository.showAllAdmins());
        return "admin/admins/showAllAdmins";
    }

    @GetMapping("/add")
    String addNewAdmin(Model model) {
        model.addAttribute("user", new User());
        return "admin/admins/addNewAdmin";
    }

    @PostMapping("/save")
    String registerPost(@Valid User user,
                        BindingResult result,
                        RedirectAttributes redirectAttributes,
                        Model model) {
        if (!user.getPassword().equals(user.getPasswordRep())) {
            result.rejectValue("passwordRep", "error.user", "Hasła nie sa takie same");
        }
        if (result.hasErrors()) {
            model.addAttribute("errors", result.getAllErrors());
            return "admin/admins/addNewAdmin";
        }
        userService.registerAdmin(user);
        redirectAttributes.addFlashAttribute("successMessage", "Dodano administratora");
        return "redirect:/admin/admins";
    }

    @GetMapping("/edit")
    String editAdmin(@RequestParam("idCon") Long id, Model model) {
        User user = userRepository.findById(id).orElseThrow();
        model.addAttribute("user", user);
        return "admin/admins/editAdmin";
    }

    @PostMapping("/edit")
    String editUser(User user,
                    BindingResult result,
                    RedirectAttributes redirectAttributes,
                    Model model) {
        if (!user.getPassword().equals(user.getPasswordRep())) {
            result.rejectValue("passwordRep", "error.user", "Hasła nie są takie same");
        } else if (user.getName().isEmpty() || user.getName().isBlank()) {
            result.rejectValue("name", "error.user", "Niepoprawne imię");
        } else if (user.getLastName().isEmpty() || user.getLastName().isBlank()) {
            result.rejectValue("lastName", "error.user", "Niepoprawne nazwisko");
        } else if (user.getPassword().isEmpty() || user.getPassword().isBlank() || user.getPassword().length() < 10) {
            result.rejectValue("password", "error.user", "Hasło jest za krótkie");
        }
        if (result.hasErrors()) {
            model.addAttribute("error", result.getAllErrors());
            model.addAttribute("user", user);
            return "admin/admins/editAdmin";
        }
        User existingUser = userService.findUserById(user.getId());
        existingUser.setName(user.getName());
        existingUser.setLastName(user.getLastName());
        existingUser.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(existingUser);
        redirectAttributes.addFlashAttribute("successMessage", "Zmieniono administratora");
        return "redirect:/admin/admins";
    }

    @PostMapping("/delete")
    String deleteAdmin(@RequestParam("idDen") Long id, RedirectAttributes redirectAttributes){
        User user = userRepository.findById(id).orElseThrow(() -> new UsernameNotFoundException("User not found with id: "+id));
        user.setRoles(Collections.emptySet());
        userRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("successMessage","Usunięto administratora");
        return "redirect:/admin/admins";
    }
}
