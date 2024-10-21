package testdemo.testdemo.Controller;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import testdemo.testdemo.Model.comment;
import testdemo.testdemo.Model.hotel;
import testdemo.testdemo.Service.adminService;
import testdemo.testdemo.Service.userService;

import java.security.Principal;
import java.util.List;

@Controller
public class hotelPageController {

    @Resource
    private adminService adminServ;
    @Resource
    private userService userServ;
    @GetMapping("/AllHotels")
    public String listHotels(ModelMap model){
        Principal principal = new Principal() {
            @Override
            public String getName() {
                return null;
            }
        };
        model.addAttribute( "hotels", adminServ.getAllHotels());
        model.addAttribute("user", principal.getName());
        return "index";
    }
    @GetMapping("/hotelInfo/{name}")
    public String hotelInfo(@PathVariable("name") String name, ModelMap model){
        model.addAttribute("hotel", adminServ.getHotel(name));
        model.addAttribute("hotelComments", adminServ.getCommentsById(name));
        model.addAttribute("commentForm", new commentForm());
        return "hotelPage";
    }

    public static class commentForm{
        private String comment;

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }
    }

    @PostMapping("/hotelInfo/{name}")
    public String addComment(@ModelAttribute("hotel") hotel hotel, @ModelAttribute("commentForm") commentForm commentForm, Principal principal){
        userServ.addComment(commentForm.getComment(), hotel, principal.getName());
        return "redirect:/hotelInfo/{name}";
    }

    @GetMapping("/addToFav/{hotelname}")
    public String addHotelToFav(@PathVariable("hotelname") String hotelname, Principal principal){
        userServ.addHotelTofav(hotelname, principal.getName(),  adminServ.getHotel(hotelname), adminServ.getUserByUsername(principal.getName()));
        return "redirect:/hotelInfo/{hotelname}";
    }
}
