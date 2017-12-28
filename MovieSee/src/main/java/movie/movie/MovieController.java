package movie.movie;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import movie.common.paging.movieListPaging;
import movie.movie.MovieCommentModel;

import movie.common.paging.movieCommentPaging;
import movie.common.paging.movieListPaging;

@Controller
public class MovieController {

   @Resource(name = "movieService")
   private MovieService movieService;
   // 영화 상세보기
   // movieList.see list_no로 갖다씀 (수정)

   // AmovieList paging
   private int currentPage = 1;
   private int totalCount;
   private int blockCount = 8;
   private int blockpaging = 5;
   private String pagingHtml;
   private movieListPaging paging;

   //movieViewComment paging
   private int currentPage2 = 1; 
   private int totalCount2; 
   private int blockCount2 = 10; 
   private int blockPage2 = 5; 
   private String pagingHtml2; 
   private movieCommentPaging page2; 
   
   String session_member_id;
   
   @RequestMapping(value = "/movieView.see", method = RequestMethod.GET)
   public ModelAndView movieList(HttpServletRequest request) throws Exception {
      ModelAndView mv = new ModelAndView();

      int movie_no = Integer.parseInt(request.getParameter("movie_no"));

      List<MovieCommentModel> commentList = movieService.commentList(movie_no);
      
      if (request.getParameter("currentPage2") == null || request.getParameter("currentPage2").trim().isEmpty() || request.getParameter("currentPage2").equals("0")) {
          currentPage2 = 1;
       }else{
          currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
       }
      totalCount2 = commentList.size();
      
      page2 = new movieCommentPaging(currentPage2, totalCount2, blockCount2, blockPage2, movie_no);
      pagingHtml2 = page2.getPagingHtml2().toString();
      
      int lastCount2 = totalCount2;
      if (page2.getEndCount2() < totalCount2) {
         lastCount2 = page2.getEndCount2() + 1;
      }
      
      commentList = commentList.subList(page2.getStartCount2(), lastCount2);
      
      /* List<MovieModel> list_no = movieService.movieList_one(movie_no); */
      MovieBannerModel bannerselect = movieService.banner_select();
      MovieModel movieModel = movieService.movieView(movie_no);
      /* mv.addObject("currentPage", currentPage); */
      movieService.updatemovieScore(movieModel);
      
      mv.addObject("movieModel", movieModel);
      /* mv.addObject("list_no", list_no); */
      mv.addObject("bannerselect", bannerselect);
      mv.addObject("commentlist", movieService.commentList(movieModel.getMovie_no()));
      mv.setViewName("MovieView");
      return mv;
   }

   // 댓글 작성
   @RequestMapping("/commentWrite.see")
   public ModelAndView commentWrite(HttpServletRequest request, HttpSession session,
         MovieCommentModel movieCommentModel) {

      ModelAndView mv = new ModelAndView();
      try {
         
         session_member_id=session.getAttribute("session_member_id").toString();
         
         if(session_member_id == null){
            mv.setViewName("MovieList");
            return mv;
         }
         
         
         if (request.getParameter("commentt").equals("") || request.getParameter("commentt").trim().isEmpty()) {

            mv.setViewName("MovieList");
            return mv;
         }
      } catch (NullPointerException up) {
         mv.setViewName("MovieList");

         return mv;
      }

      int movie_no = Integer.parseInt(request.getParameter("view_no"));

      movieCommentModel.setCommentt(request.getParameter("commentt").replaceAll("\r\n", "<br />"));
      movieCommentModel.setMovie_no(movie_no);
      movieCommentModel.setCmter(session_member_id);

      movieService.writecomment(movieCommentModel);

      mv.setViewName("redirect:movieView.see?movie_no=" + movie_no);

      return mv;
   }

   // 댓글 삭제
   @RequestMapping("/commentDelete.see")
   public ModelAndView commentDelete(HttpServletRequest request, MovieCommentModel movieCommentModel) {

      ModelAndView mv = new ModelAndView();

      movieService.deletecomment(movieCommentModel);

      mv.setViewName("redirect:movieView.see?movie_no=" + movieCommentModel.getMovie_no());

      return mv;
   }

   // 영화 부분
   @RequestMapping("aMovieList.see")
   public ModelAndView aMovieList(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();
      List<MovieModel> movieboxofficeList = movieService.movieBoxofficeList();
      MovieBannerModel bannerselect = movieService.banner_select();

      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
            || request.getParameter("currentPage").equals("0")) {
         currentPage = 1;
      } else {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
      }

      totalCount = movieboxofficeList.size();

      paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "aMovieList");
      pagingHtml = paging.getPagingHtml().toString();

      int lastCount = totalCount;

      if (paging.getEndCount() < totalCount) {
         lastCount = paging.getEndCount() + 1;
      }

      movieboxofficeList = movieboxofficeList.subList(paging.getStartCount(), lastCount);

      mv.addObject("movieintroselect", movieintroselect); // top, content 배너
      mv.addObject("movieboxofficeList", movieboxofficeList); // 영화 list
      mv.addObject("bannerselect", bannerselect); // 하단 배너
      mv.addObject("currentPage", currentPage);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("totalCount", totalCount);

      mv.setViewName("aMovieList");
      return mv;
   }

   @RequestMapping("aaMovieList.see")
   public ModelAndView aaMovieList(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();
      List<MovieModel> movieboxofficeList2 = movieService.movieBoxofficeList();
      MovieBannerModel bannerselect = movieService.banner_select();

      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
          currentPage = 1;
       }else{
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
      
      totalCount = movieboxofficeList2.size();
      
      paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "aaMovieList");
      pagingHtml = paging.getPagingHtml().toString();

      int lastCount = totalCount;

      if (paging.getEndCount() < totalCount) {
         lastCount = paging.getEndCount() + 1;
      }
      
      movieboxofficeList2 = movieboxofficeList2.subList(paging.getStartCount(), lastCount);
      
      mv.addObject("movieintroselect", movieintroselect); // top, content 배너
      mv.addObject("movieboxofficeList2", movieboxofficeList2); // 영화 list
      mv.addObject("bannerselect", bannerselect); // 하단 배너
      mv.addObject("currentPage", currentPage);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("totalCount", totalCount);

      mv.setViewName("aaMovieList");
      return mv;
   }

   @RequestMapping("bMovieList.see")
   public ModelAndView bmovieList(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();
      List<MovieModel> moviearteList = movieService.movieArteList();
      MovieBannerModel bannerselect = movieService.banner_select();

      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
          currentPage = 1;
       }else{
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
      
      totalCount = moviearteList.size();
      
      paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "bMovieList");
      pagingHtml = paging.getPagingHtml().toString();

      int lastCount = totalCount;

      if (paging.getEndCount() < totalCount) {
         lastCount = paging.getEndCount() + 1;
      }
      
      moviearteList = moviearteList.subList(paging.getStartCount(), lastCount);
      /* MovieModel moviearteList = movieService.movieArteList(); */

      mv.addObject("movieintroselect", movieintroselect);
      mv.addObject("moviearteList", moviearteList);
      mv.addObject("bannerselect", bannerselect);
      mv.addObject("currentPage", currentPage);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("totalCount", totalCount);

      mv.setViewName("bMovieList");
      return mv;
   }

   @RequestMapping("cMovieList.see")
   public ModelAndView cMovieList(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();
      List<MovieModel> moviegcinemaList = movieService.movieGcinemaList();
      MovieBannerModel bannerselect = movieService.banner_select();

      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
          currentPage = 1;
       }else{
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
      
      totalCount = moviegcinemaList.size();
      
      paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "bMovieList");
      pagingHtml = paging.getPagingHtml().toString();

      int lastCount = totalCount;

      if (paging.getEndCount() < totalCount) {
         lastCount = paging.getEndCount() + 1;
      }
      
      moviegcinemaList = moviegcinemaList.subList(paging.getStartCount(), lastCount);
      
      mv.addObject("movieintroselect", movieintroselect);
      mv.addObject("moviegcinemaList", moviegcinemaList);
      mv.addObject("bannerselect", bannerselect);
      mv.addObject("currentPage", currentPage);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("totalCount", totalCount);

      mv.setViewName("cMovieList");
      return mv;
   }

   @RequestMapping("dMovieList.see")
   public ModelAndView dMovieList(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();
      List<MovieModel> moviechinamovieList = movieService.movieChinamovieList();
      MovieBannerModel bannerselect = movieService.banner_select();

      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
          currentPage = 1;
       }else{
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
      
      totalCount = moviechinamovieList.size();
      
      paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "dMovieList");
      pagingHtml = paging.getPagingHtml().toString();

      int lastCount = totalCount;

      if (paging.getEndCount() < totalCount) {
         lastCount = paging.getEndCount() + 1;
      }
      
      moviechinamovieList = moviechinamovieList.subList(paging.getStartCount(), lastCount);
      
      mv.addObject("movieintroselect", movieintroselect);
      mv.addObject("moviechinamovieList", moviechinamovieList);
      mv.addObject("bannerselect", bannerselect);
      mv.addObject("currentPage", currentPage);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("totalCount", totalCount);

      mv.setViewName("dMovieList");
      return mv;
   }

   @RequestMapping("eMovieList.see")
   public ModelAndView eMovieList(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();
      List<MovieModel> movieoperaList = movieService.movieOperaList();
      MovieBannerModel bannerselect = movieService.banner_select();

      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
          currentPage = 1;
       }else{
          currentPage = Integer.parseInt(request.getParameter("currentPage"));
       }
      
      totalCount = movieoperaList.size();
      
      paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "eMovieList");
      pagingHtml = paging.getPagingHtml().toString();

      int lastCount = totalCount;

      if (paging.getEndCount() < totalCount) {
         lastCount = paging.getEndCount() + 1;
      }
      
      movieoperaList = movieoperaList.subList(paging.getStartCount(), lastCount);
      
      mv.addObject("movieintroselect", movieintroselect);
      mv.addObject("movieoperaList", movieoperaList);
      mv.addObject("bannerselect", bannerselect);
      mv.addObject("currentPage", currentPage);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("totalCount", totalCount);
      
      mv.setViewName("eMovieList");
      return mv;
   }

   // MovieTheater 부분
   @RequestMapping("aMovieTheater.see")
   public ModelAndView aMovieTheater(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();

      mv.addObject("movieintroselect", movieintroselect);
      mv.setViewName("aMovieTheater");
      return mv;
   }

   @RequestMapping("bMovieTheater.see")
   public ModelAndView bMovieTheater(HttpServletRequest request) {

      ModelAndView mv = new ModelAndView();
      MovieIntroModel movieintroselect = movieService.movieintro_Select();

      mv.addObject("movieintroselect", movieintroselect);
      mv.setViewName("bMovieTheater");
      return mv;
   }

}