package movie.admin;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import movie.common.paging.movieListPaging; 
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import movie.reserve.ReserveTimeTableModel;
import movie.movie.MovieBannerModel;
import movie.movie.MovieModel;
import movie.movie.MovieService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource 
	private MovieService movieService;
	@Resource
	private AdminService adminService;
	
	@ModelAttribute("movieModel")
	public MovieModel movieModel() {
		return new MovieModel();
	}
	
	Logger log = Logger.getLogger(this.getClass());
	
	//AmovieList paging
    private int currentPage = 1;
	private int totalCount;
	private int blockCount = 8;
	private int blockpaging = 5;
	private String pagingHtml;
	private movieListPaging paging;
	
	private String uploadPath = "C:/github/finalproject/MovieSee/src/main/webapp/resources/upload/movie/main_movie/";

	// 상영작 리스트
	@RequestMapping(value="/movieList.see", method = RequestMethod.GET)
	public ModelAndView movieList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<MovieModel> movielist = movieService.movieList();
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
 			currentPage = 1;
 		}else{
 			currentPage = Integer.parseInt(request.getParameter("currentPage"));
 		}
		
		totalCount = movielist.size();
		
		paging = new movieListPaging(currentPage, totalCount, blockCount, blockpaging, "movieList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (paging.getEndCount() < totalCount) {
			lastCount = paging.getEndCount() + 1;
		}
		
		movielist = movielist.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("movielist", movielist);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("totalCount", totalCount);
		
		mv.setViewName("admin");
		return mv;
	}

	// 상영작 상세보기
	@RequestMapping(value="/movieView.see", method = RequestMethod.GET)
	public ModelAndView movieView(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		int movie_no = Integer.parseInt(request.getParameter("movie_no"));
		
		MovieModel movieModel = movieService.movieView(movie_no);
		
		mv.addObject("movieModel",movieModel);
		
		mv.setViewName("MovieView");
		return mv;
	}
	
	// 상영작 글쓰기 폼 get
	@RequestMapping(value="/movieWrite.see")
	public ModelAndView movieWrite(HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("MovieWrite");
		return mv;
	}
	
	// 상영작 글쓰기 post
	@RequestMapping(value = "/movieWrite.see", method = RequestMethod.POST)
	public ModelAndView movieWrite2(@ModelAttribute("movieModel") MovieModel movieModel, BindingResult result, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest) throws IOException{

		String movie_story = movieModel.getMovie_story().replaceAll("\r\n", "<br />");
		movieModel.setMovie_story(movie_story);
		
		ModelAndView mv = new ModelAndView();
		
		try {
	         movieModel.setMovie_date(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("movie_date")));
	      } catch (ParseException e) {
	         e.printStackTrace();
	      }
		
   	MultipartFile multipartFile = multipartHttpServletRequest.getFile("movie_poster");
   	String filename = multipartFile.getOriginalFilename();
   	if (filename != ""){ 
   		movieModel.setMovie_poster(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());					    
		    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));			            	        
   	}else{
   		movieModel.setMovie_poster("NULL");		
   	}
   	
   	MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("movie_stillcut");
   	String filename1 = multipartFile1.getOriginalFilename();
   	if (filename1 != ""){ 
   		movieModel.setMovie_stillcut(System.currentTimeMillis()+"_"+multipartFile1.getOriginalFilename());					    
		    String savimagename1 = System.currentTimeMillis()+"_"+multipartFile1.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile1.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename1));			            	        
   	}else{
   		movieModel.setMovie_stillcut("NULL");		
   	}
   	
   	MultipartFile multipartFile2 = multipartHttpServletRequest.getFile("movie_stillcut1");
   	String filename2 = multipartFile.getOriginalFilename();
   	if (filename2 != ""){ 
   		movieModel.setMovie_stillcut1(System.currentTimeMillis()+"_"+multipartFile2.getOriginalFilename());					    
		    String savimagename2 = System.currentTimeMillis()+"_"+multipartFile2.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile2.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename2));			            	        
   	}else{
   		movieModel.setMovie_stillcut1("NULL");		
   	}
   	
   	MultipartFile multipartFile3 = multipartHttpServletRequest.getFile("movie_stillcut2");
   	String filename3 = multipartFile3.getOriginalFilename();
   	if (filename3 != ""){ 
   		movieModel.setMovie_stillcut2(System.currentTimeMillis()+"_"+multipartFile3.getOriginalFilename());					    
		    String savimagename3 = System.currentTimeMillis()+"_"+multipartFile3.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile3.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename3));			            	        
   	}else{
   		movieModel.setMovie_stillcut2("NULL");		
   	}
   	
   	MultipartFile multipartFile4 = multipartHttpServletRequest.getFile("movie_stillcut3");
   	String filename4 = multipartFile4.getOriginalFilename();
   	if (filename4 != ""){ 
   		movieModel.setMovie_stillcut3(System.currentTimeMillis()+"_"+multipartFile4.getOriginalFilename());					    
		    String savimagename4 = System.currentTimeMillis()+"_"+multipartFile4.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile4.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename4));			            	        
   	}else{
   		movieModel.setMovie_stillcut3("NULL");		
   	}
   	
   	MultipartFile multipartFile5 = multipartHttpServletRequest.getFile("movie_stillcut4");
   	String filename5 = multipartFile5.getOriginalFilename();
   	if (filename5 != ""){ 
   		movieModel.setMovie_stillcut4(System.currentTimeMillis()+"_"+multipartFile5.getOriginalFilename());					    
		    String savimagename5 = System.currentTimeMillis()+"_"+multipartFile5.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile5.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename5));			            	        
   	}else{
   		movieModel.setMovie_stillcut4("NULL");		
   	}
   	
   	MultipartFile multipartFile6 = multipartHttpServletRequest.getFile("movie_director_picture");
   	String filename6 = multipartFile6.getOriginalFilename();
   	if (filename6 != ""){ 
   		movieModel.setMovie_director_picture(System.currentTimeMillis()+"_"+multipartFile6.getOriginalFilename());					    
		    String savimagename6 = System.currentTimeMillis()+"_"+multipartFile6.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile6.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename6));			            	        
   	}else{
   		movieModel.setMovie_director_picture("NULL");		
   	}
   	
   	MultipartFile multipartFile7 = multipartHttpServletRequest.getFile("movie_actor_picture");
   	String filename7 = multipartFile7.getOriginalFilename();
   	if (filename7 != ""){ 
   		movieModel.setMovie_actor_picture(System.currentTimeMillis()+"_"+multipartFile7.getOriginalFilename());					    
		    String savimagename7 = System.currentTimeMillis()+"_"+multipartFile7.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile7.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename7));			            	        
   	}else{
   		movieModel.setMovie_actor_picture("NULL");		
   	}
   	
   	MultipartFile multipartFile8 = multipartHttpServletRequest.getFile("movie_actor_picture1");
   	String filename8 = multipartFile8.getOriginalFilename();
   	if (filename8 != ""){ 
   		movieModel.setMovie_actor_picture1(System.currentTimeMillis()+"_"+multipartFile8.getOriginalFilename());					    
		    String savimagename8 = System.currentTimeMillis()+"_"+multipartFile8.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile8.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename8));			            	        
   	}else{
   		movieModel.setMovie_actor_picture1("NULL");		
   	}
   	
   	MultipartFile multipartFile9 = multipartHttpServletRequest.getFile("movie_actor_picture2");
   	String filename9 = multipartFile9.getOriginalFilename();
   	if (filename9 != ""){ 
   		movieModel.setMovie_actor_picture2(System.currentTimeMillis()+"_"+multipartFile9.getOriginalFilename());					    
		    String savimagename9 = System.currentTimeMillis()+"_"+multipartFile9.getOriginalFilename();				    
	        FileCopyUtils.copy(multipartFile9.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename9));			            	        
   	}else{
   		movieModel.setMovie_actor_picture2("NULL");		
   	}
       	
		movieService.movieWrite(movieModel); 
		
		mv.setViewName("redirect:/admin/movieList.see");
	    return mv;
	}
	
	// 상영작 삭제 - 완료
	@RequestMapping(value = "/movieDelete.see", method = RequestMethod.GET)
	public String movieDelete(HttpServletRequest request) {
		int movie_no = Integer.parseInt(request.getParameter("movie_no"));

		// System.out.println(movie_no);

		movieService.movieDelete(movie_no);

		return "redirect:movieList.see";
	}
	
	// 상영작 수정폼get - jsp폼 수정필요
	@RequestMapping(value = "/movieUpdate.see", method = RequestMethod.GET)
	public ModelAndView movieUpdate(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		int movie_no = Integer.parseInt(request.getParameter("movie_no"));

		MovieModel movieModel = movieService.movieView(movie_no);
		
		String movie_story = movieModel.getMovie_story().replaceAll("\r\n", "<br />");
		movieModel.setMovie_story(movie_story);
		
		mv.addObject("movieModel",movieModel);
		mv.setViewName("AdminMovieUpdate");
		return mv;
		}
		
		//상영작 수정post - 완료
			@RequestMapping(value = "/movieUpdate.see", method = RequestMethod.POST)
			public String movieUpdate2(@ModelAttribute("movieModel") MovieModel movieModel, BindingResult result,
					MultipartHttpServletRequest multipartHttpServletRequest, MultipartHttpServletRequest request) {
			
				try {
			         movieModel.setMovie_date(new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("movie_date")));
			      } catch (ParseException e) {
			         e.printStackTrace();
			      }
				
				if (multipartHttpServletRequest.getFile("file[0]") != null){
			        	MultipartFile multipartFile = multipartHttpServletRequest.getFile("file[0]");
			        	String filename = multipartFile.getOriginalFilename();
				        	if (filename != ""){ 
				        		movieModel.setMovie_poster(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieModel.setMovie_poster(multipartHttpServletRequest.getParameter("movie_poster"));
			        }
				
				if (multipartHttpServletRequest.getFile("file[1]") != null){
		        	MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("file[1]");
		        	String filename1 = multipartFile1.getOriginalFilename();
			        	if (filename1 != ""){ 
			        		movieModel.setMovie_stillcut(System.currentTimeMillis()+"_"+multipartFile1.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile1.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile1.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_stillcut(multipartHttpServletRequest.getParameter("movie_stillcut"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[2]") != null){
		        	MultipartFile multipartFile2 = multipartHttpServletRequest.getFile("file[2]");
		        	String filename2 = multipartFile2.getOriginalFilename();
			        	if (filename2 != ""){ 
			        		movieModel.setMovie_stillcut1(System.currentTimeMillis()+"_"+multipartFile2.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile2.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile2.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_stillcut1(multipartHttpServletRequest.getParameter("movie_stillcut1"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[3]") != null){
		        	MultipartFile multipartFile3 = multipartHttpServletRequest.getFile("file[3]");
		        	String filename3 = multipartFile3.getOriginalFilename();
			        	if (filename3 != ""){ 
			        		movieModel.setMovie_stillcut2(System.currentTimeMillis()+"_"+multipartFile3.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile3.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile3.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_stillcut2(multipartHttpServletRequest.getParameter("movie_stillcut2"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[4]") != null){
		        	MultipartFile multipartFile4 = multipartHttpServletRequest.getFile("file[4]");
		        	String filename4 = multipartFile4.getOriginalFilename();
			        	if (filename4 != ""){ 
			        		movieModel.setMovie_stillcut3(System.currentTimeMillis()+"_"+multipartFile4.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile4.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile4.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_stillcut3(multipartHttpServletRequest.getParameter("movie_stillcut3"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[5]") != null){
		        	MultipartFile multipartFile5 = multipartHttpServletRequest.getFile("file[5]");
		        	String filename5 = multipartFile5.getOriginalFilename();
			        	if (filename5 != ""){ 
			        		movieModel.setMovie_stillcut4(System.currentTimeMillis()+"_"+multipartFile5.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile5.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile5.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_stillcut4(multipartHttpServletRequest.getParameter("movie_stillcut4"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[6]") != null){
		        	MultipartFile multipartFile6 = multipartHttpServletRequest.getFile("file[6]");
		        	String filename6 = multipartFile6.getOriginalFilename();
			        	if (filename6 != ""){ 
			        		movieModel.setMovie_director_picture(System.currentTimeMillis()+"_"+multipartFile6.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile6.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile6.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_director_picture(multipartHttpServletRequest.getParameter("movie_director_picture"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[7]") != null){
		        	MultipartFile multipartFile7 = multipartHttpServletRequest.getFile("file[7]");
		        	String filename7 = multipartFile7.getOriginalFilename();
			        	if (filename7 != ""){ 
			        		movieModel.setMovie_actor_picture(System.currentTimeMillis()+"_"+multipartFile7.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile7.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile7.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_actor_picture(multipartHttpServletRequest.getParameter("movie_actor_picture"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[8]") != null){
		        	MultipartFile multipartFile8 = multipartHttpServletRequest.getFile("file[8]");
		        	String filename8 = multipartFile8.getOriginalFilename();
			        	if (filename8 != ""){ 
			        		movieModel.setMovie_actor_picture1(System.currentTimeMillis()+"_"+multipartFile8.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile8.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile8.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_actor_picture1(multipartHttpServletRequest.getParameter("movie_actor_picture1"));
		        }
				
				if (multipartHttpServletRequest.getFile("file[9]") != null){
		        	MultipartFile multipartFile9 = multipartHttpServletRequest.getFile("file[9]");
		        	String filename9 = multipartFile9.getOriginalFilename();
			        	if (filename9 != ""){ 
			        		movieModel.setMovie_actor_picture2(System.currentTimeMillis()+"_"+multipartFile9.getOriginalFilename());					    
						    String savimagename = System.currentTimeMillis()+"_"+multipartFile9.getOriginalFilename();				    
					        try {
								FileCopyUtils.copy(multipartFile9.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
							} catch (FileNotFoundException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							} catch (IOException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}			            	        
			        	}
		        }else{
		        	movieModel.setMovie_actor_picture2(multipartHttpServletRequest.getParameter("movie_actor_picture2"));
		        }
				
				
				movieService.movieUpdate(movieModel);

				return "redirect:movieList.see";
			}
	// 스케쥴 등록 
			@RequestMapping(value = "/timeTableWrite.see", method = RequestMethod.POST)
			public String timeTableWrite(HttpServletRequest request) throws ParseException{
			
			// 모델등록
			ReserveTimeTableModel timetablemodel = new ReserveTimeTableModel();		
			// 날짜변환
			Date timetable_start_date;
			Date timetable_end_date;
			Date timetable_show_date;
			
			timetable_start_date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("start_date"));
			timetable_end_date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("end_date"));
			timetable_show_date = new SimpleDateFormat("yyyyMMdd").parse(request.getParameter("show_date"));
			
			//detail 파라미터
			int timetable_movie_no = Integer.parseInt(request.getParameter("movie_no"));
			String timetable_start_time = request.getParameter("start_time");
			String timetable_end_time = request.getParameter("end_time");
			int timetable_adult_amt = Integer.parseInt(request.getParameter("adult_amt"));
			int timetable_child_amt = Integer.parseInt(request.getParameter("child_amt"));
			int timetable_total_seat = Integer.parseInt(request.getParameter("total_seat"));
			
			AdminMovieModel adminMovieModel = adminService.searchname(timetable_movie_no);
			// 번호 이름 가져오기
			String timetable_movie_name = adminMovieModel.getMovie_name();
			//timetable Model
			timetablemodel.setTimetable_movie_no(timetable_movie_no);
			timetablemodel.setTimetable_movie_name(timetable_movie_name);
			timetablemodel.setTimetable_start_date(timetable_start_date);
			timetablemodel.setTimetable_end_date(timetable_end_date);
			timetablemodel.setTimetable_show_date(timetable_show_date);
			timetablemodel.setTimetable_start_time(timetable_start_time);
			timetablemodel.setTimetable_end_time(timetable_end_time);
			timetablemodel.setTimetable_adult_amt(timetable_adult_amt);
			timetablemodel.setTimetable_child_amt(timetable_child_amt);
			timetablemodel.setTimetable_total_seat(timetable_total_seat);
			timetablemodel.setTimetable_reserved_seat(timetable_total_seat);
			
			adminService.timeDetailInsert(timetablemodel);
			
			return "redirect:timeTableList.see";	
		}

	
	// 스케쥴 리스트
	@RequestMapping(value = "/timeTableList.see", method = RequestMethod.GET)
	public ModelAndView timeTableList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		List<ReserveTimeTableModel> timetable_list = adminService.timetable_list();
		List<AdminMovieModel> selectmovie_name = adminService.selectmovie_name();
		
		mv.addObject("timetable_list", timetable_list);
		mv.addObject("selectmovie_name", selectmovie_name);
		mv.setViewName("TimeTableList");
		return mv;
	}
	
	
		
	// 스케쥴 삭제 - 테스트해봐야함
	@RequestMapping(value = "/timeTableDelete.see", method = RequestMethod.GET)
	public String timeTableDelete(HttpServletRequest request){
			
		int timetable_no = Integer.parseInt(request.getParameter("timetable_no"));
			
		adminService.timetableDelete(timetable_no);
			
		return "redirect:timeTableList.see";
	}

//이벤트 & 배너 조회
		@RequestMapping(value="/bannerList.see", method = RequestMethod.GET)
		public ModelAndView bannerList(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView();
			
			MovieBannerModel bannerselect = movieService.banner_select();
			
			mv.addObject("bannerselect", bannerselect);
			
			mv.setViewName("BannerList");
			return mv;
		}
		
	//이벤트 & 배너 수정폼
		@RequestMapping(value = "/bannerUpdate.see", method = RequestMethod.GET)
		public ModelAndView bannerUpdate(HttpServletRequest request) {
			ModelAndView mv = new ModelAndView();
			
			MovieBannerModel bannerselect = movieService.bannerView();

			mv.addObject("bannerselect", bannerselect);
			mv.setViewName("BannerUpdate");
			return mv;
		}

	//이벤트 & 배너 수정post 
				@RequestMapping(value = "/bannerUpdate.see", method=RequestMethod.POST )
				public ModelAndView bannerUpdate2(@ModelAttribute("MovieBannerModel") MovieBannerModel movieBannerModel, BindingResult result,
						MultipartHttpServletRequest multipartHttpServletRequest, MultipartHttpServletRequest request) {
					
					ModelAndView mv = new ModelAndView();
					
					if (multipartHttpServletRequest.getFile("file[0]") != null){
			        	MultipartFile multipartFile = multipartHttpServletRequest.getFile("file[0]");
			        	String filename = multipartFile.getOriginalFilename();
				        	if (filename != ""){ 
				        		movieBannerModel.setBanner_left(System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_left(multipartHttpServletRequest.getParameter("banner_left"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[1]") != null){
			        	MultipartFile multipartFile1 = multipartHttpServletRequest.getFile("file[1]");
			        	String filename1 = multipartFile1.getOriginalFilename();
				        	if (filename1 != ""){ 
				        		movieBannerModel.setBanner_left1(System.currentTimeMillis()+"_"+multipartFile1.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile1.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile1.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_left1(multipartHttpServletRequest.getParameter("banner_left1"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[2]") != null){
			        	MultipartFile multipartFile2 = multipartHttpServletRequest.getFile("file[2]");
			        	String filename2 = multipartFile2.getOriginalFilename();
				        	if (filename2 != ""){ 
				        		movieBannerModel.setBanner_center(System.currentTimeMillis()+"_"+multipartFile2.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile2.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile2.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_center(multipartHttpServletRequest.getParameter("banner_center"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[3]") != null){
			        	MultipartFile multipartFile3 = multipartHttpServletRequest.getFile("file[3]");
			        	String filename3 = multipartFile3.getOriginalFilename();
				        	if (filename3 != ""){ 
				        		movieBannerModel.setBanner_center1(System.currentTimeMillis()+"_"+multipartFile3.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile3.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile3.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_center1(multipartHttpServletRequest.getParameter("banner_center1"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[4]") != null){
			        	MultipartFile multipartFile4 = multipartHttpServletRequest.getFile("file[4]");
			        	String filename4 = multipartFile4.getOriginalFilename();
				        	if (filename4 != ""){ 
				        		movieBannerModel.setBanner_right(System.currentTimeMillis()+"_"+multipartFile4.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile4.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile4.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_right(multipartHttpServletRequest.getParameter("banner_right"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[5]") != null){
			        	MultipartFile multipartFile5 = multipartHttpServletRequest.getFile("file[5]");
			        	String filename5 = multipartFile5.getOriginalFilename();
				        	if (filename5 != ""){ 
				        		movieBannerModel.setBanner_right1(System.currentTimeMillis()+"_"+multipartFile5.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile5.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile5.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_right1(multipartHttpServletRequest.getParameter("banner_right1"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[6]") != null){
			        	MultipartFile multipartFile6 = multipartHttpServletRequest.getFile("file[6]");
			        	String filename6 = multipartFile6.getOriginalFilename();
				        	if (filename6 != ""){ 
				        		movieBannerModel.setBanner_bottom(System.currentTimeMillis()+"_"+multipartFile6.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile6.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile6.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_bottom(multipartHttpServletRequest.getParameter("banner_bottom"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[7]") != null){
			        	MultipartFile multipartFile7 = multipartHttpServletRequest.getFile("file[7]");
			        	String filename7 = multipartFile7.getOriginalFilename();
				        	if (filename7 != ""){ 
				        		movieBannerModel.setBanner_footer(System.currentTimeMillis()+"_"+multipartFile7.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile7.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile7.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_footer(multipartHttpServletRequest.getParameter("banner_footer"));
			        }
					
					if (multipartHttpServletRequest.getFile("file[8]") != null){
			        	MultipartFile multipartFile8 = multipartHttpServletRequest.getFile("file[8]");
			        	String filename8 = multipartFile8.getOriginalFilename();
				        	if (filename8 != ""){ 
				        		movieBannerModel.setBanner_footer1(System.currentTimeMillis()+"_"+multipartFile8.getOriginalFilename());					    
							    String savimagename = System.currentTimeMillis()+"_"+multipartFile8.getOriginalFilename();				    
						        try {
									FileCopyUtils.copy(multipartFile8.getInputStream(), new FileOutputStream(uploadPath+"/"+savimagename));
								} catch (FileNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (IOException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}			            	        
				        	}
			        }else{
			        	movieBannerModel.setBanner_footer1(multipartHttpServletRequest.getParameter("banner_footer1"));
			        }
					
					movieService.bannerUpdate(movieBannerModel);
					mv.setViewName("redirect:bannerList.see");
					
					return mv;
				}
}