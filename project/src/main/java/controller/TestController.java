package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller // controller 역할을 수행하는 @Component 객체이다.
@RequestMapping("test") // path에 cart으로 들어오는 요청을 처리해준다. (/cart/)
public class TestController {

	@GetMapping("*")
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
