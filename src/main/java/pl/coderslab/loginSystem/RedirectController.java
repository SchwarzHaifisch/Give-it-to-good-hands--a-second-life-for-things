package pl.coderslab.loginSystem;


import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RedirectController {
    @GetMapping("/redirect")
    String redirect(Authentication authentication){
        if (authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_ADMIN"))){
            return "redirect:/admin/main";
        }else if(authentication.getAuthorities().contains(new SimpleGrantedAuthority("ROLE_USER"))){
            return "redirect:/user/main";
        }else{
            //here can add anothers roles redirects
            return "redirect:/";
        }
    }
}
