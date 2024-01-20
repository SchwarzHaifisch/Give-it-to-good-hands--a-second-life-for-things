package pl.coderslab.loginSystem;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;


@Controller
@RequiredArgsConstructor
@RequestMapping("/register")
class UserController {

    private final UserService userService;

    @GetMapping
    String register(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping
    String registerPost(@Valid User user, BindingResult result, @RequestParam String confirmPassword) {
        if (!user.getPassword().equals(confirmPassword)) {
            result.rejectValue("password", "error.user", "Hasła nie sa takie same");
        }
        if (result.hasErrors()) {
            return "register";
        }
        userService.registerUser(user);
        return "redirect:/";
    }
}