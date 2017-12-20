package movie.movie;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import movie.movie.MovieCommentModel;

@Controller
public class MovieController{
   
   @Resource(name="movieService")
   private MovieService movieService;
   //영화 상세보기
   //movieList.see  list_no로 갖다씀 (수정)
   
   @RequestMapping(value="/movieView.see", method = RequestMethod.GET)
   public ModelAndView movieList(HttpServletRequest request) throws Exception{
      ModelAndView mv = new ModelAndView();
   
      int movie_no = Integer.parseInt(request.getParameter("movie_no"));
      
      /*List<MovieModel> list_no = movieService.movieList_one(movie_no);*/
      MovieBannerModel bannerselect = movieService.banner_select();
      
      MovieModel movieModel = movieService.movieView(movie_no);
      
      /*mv.addObject("currentPage", currentPage);*/
      movieService.updatemovieScore(movieModel);
      
      mv.addObject("movieModel",movieModel);
      /*mv.addObject("list_no", list_no);*/
      mv.addObject("bannerselect", bannerselect);
      mv.addObject("commentlist", movieService.commentList(movieModel.getMovie_no()));
      mv.setViewName("MovieView");
      return mv;
   }
   
   //댓글 작성
   @RequestMapping("/commentWrite.see")
   public ModelAndView commentWrite(HttpServletRequest request, HttpSession session, MovieCommentModel movieCommentModel) {
   
      ModelAndView mv = new ModelAndView();
      try {
      if(request.getParameter("commentt").equals("") || request.getParameter("commentt").trim().isEmpty()) {
         
         mv.setViewName("MovieList");
         return mv;
      }
      }
      catch(NullPointerException up) {
         mv.setViewName("MovieList");
         
         return mv;
      }
      
      int movie_no = Integer.parseInt(request.getParameter("view_no"));
      
      movieCommentModel.setCommentt(request.getParameter("commentt").replaceAll("\r\n", "<br />"));
      movieCommentModel.setMovie_no(movie_no);
      
      movieService.writecomment(movieCommentModel);
      
      mv.setViewName("redirect:movieView.see?movie_no="+movie_no);
      
      return mv;
   }
   
   //댓글 삭제
   @RequestMapping("/commentDelete.see")
   public ModelAndView commentDelete(HttpServletRequest request, MovieCommentModel movieCommentModel ){
   
      ModelAndView mv = new ModelAndView();
      
      movieService.deletecomment(movieCommentModel);
      
      mv.setViewName("redirect:movieView.see?movie_no="+movieCommentModel.getMovie_no());
      
      return mv;
   }
   
   // 영화 부분
   @RequestMapping("aMovieList.see")
      public ModelAndView aMovieList(HttpServletRequest request){
         
         ModelAndView mv = new ModelAndView();
         MovieIntroModel movieintroselect = movieService.movieintro_Select();
         List<MovieModel> movieboxofficeList = movieService.movieBoxofficeList();
         MovieBannerModel bannerselect = movieService.banner_select();
         
         mv.addObject("movieintroselect", movieintroselect);      // top, content 배너
         mv.addObject("movieboxofficeList", movieboxofficeList);   // 영화 list
         mv.addObject("bannerselect", bannerselect);            // 하단 배너
         
         mv.setViewName("aMovieList");
         return mv;
      }
   
   @RequestMapping("aaMovieList.see")
      public ModelAndView aaMovieList(HttpServletRequest request){
         
         ModelAndView mv = new ModelAndView();
         MovieIntroModel movieintroselect = movieService.movieintro_Select();
         List<MovieModel> movieboxofficeList2 = movieService.movieBoxofficeList();
         MovieBannerModel bannerselect = movieService.banner_select();
         
         mv.addObject("movieintroselect", movieintroselect);      // top, content 배너
         mv.addObject("movieboxofficeList2", movieboxofficeList2);   // 영화 list
         mv.addObject("bannerselect", bannerselect);            // 하단 배너
         
         mv.setViewName("aaMovieList");
         return mv;
      }
   
   @RequestMapping("bMovieList.see")
      public ModelAndView bmovieList(HttpServletRequest request){
         
         ModelAndView mv = new ModelAndView();
         MovieIntroModel movieintroselect = movieService.movieintro_Select();
         List<MovieModel> moviearteList = movieService.movieArteList();
         MovieBannerModel bannerselect = movieService.banner_select();
         
         /*MovieModel moviearteList = movieService.movieArteList();*/
         
         mv.addObject("movieintroselect", movieintroselect);
         mv.addObject("moviearteList", moviearteList);
         mv.addObject("bannerselect", bannerselect);
         
         mv.setViewName("bMovieList");
         return mv;
      }
   @RequestMapping("cMovieList.see")
      public ModelAndView cMovieList(HttpServletRequest request){
         
         ModelAndView mv = new ModelAndView();
         MovieIntroModel movieintroselect = movieService.movieintro_Select();
         List<MovieModel> moviegcinemaList = movieService.movieGcinemaList();
         MovieBannerModel bannerselect = movieService.banner_select();
         
         mv.addObject("movieintroselect", movieintroselect);
         mv.addObject("moviegcinemaList", moviegcinemaList);
         mv.addObject("bannerselect", bannerselect);
         
         mv.setViewName("cMovieList");
         return mv;
      }
   @RequestMapping("dMovieList.see")
      public ModelAndView dMovieList(HttpServletRequest request){
         
         ModelAndView mv = new ModelAndView();
         MovieIntroModel movieintroselect = movieService.movieintro_Select();
         List<MovieModel> moviechinamovieList = movieService.movieChinamovieList();
         MovieBannerModel bannerselect = movieService.banner_select();
         
         mv.addObject("movieintroselect", movieintroselect);  
         mv.addObject("moviechinamovieList", moviechinamovieList);
         mv.addObject("bannerselect", bannerselect);
         
         mv.setViewName("dMovieList");
         return mv;
      }
   @RequestMapping("eMovieList.see")
      public ModelAndView eMovieList(HttpServletRequest request){
         
         ModelAndView mv = new ModelAndView();
         MovieIntroModel movieintroselect = movieService.movieintro_Select();
         List<MovieModel> movieoperaList = movieService.movieOperaList();
         MovieBannerModel bannerselect = movieService.banner_select();
         
         mv.addObject("movieintroselect", movieintroselect);
         mv.addObject("movieoperaList", movieoperaList);
         mv.addObject("bannerselect", bannerselect);
         
         mv.setViewName("eMovieList");
         return mv;
      }

   //MovieTheater 부분
      @RequestMapping("aMovieTheater.see")
         public ModelAndView aMovieTheater(HttpServletRequest request){
            
            ModelAndView mv = new ModelAndView();
            MovieIntroModel movieintroselect = movieService.movieintro_Select();
            
            mv.addObject("movieintroselect", movieintroselect);
            mv.setViewName("aMovieTheater");
            return mv;
         }
      
       @RequestMapping("bMovieTheater.see")
         public ModelAndView bMovieTheater(HttpServletRequest request){
          
            ModelAndView mv = new ModelAndView();
            MovieIntroModel movieintroselect = movieService.movieintro_Select();
            
            mv.addObject("movieintroselect", movieintroselect);
            mv.setViewName("bMovieTheater");
            return mv;
         }
   
}