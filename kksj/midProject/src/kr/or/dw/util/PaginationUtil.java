package kr.or.dw.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class PaginationUtil {
   
   private Map<String, Integer> config = new HashMap<>();
   
   public Map<String, Integer> getConfig(){
      return config;
   }
   
   public void setConfig(int page, int countList, int countPage, int totalCount) {
      /*
       * page : 실제 입력된 페이지의 숫자(사용자가 선택한 페이지 숫자)
       * countList : 한 페이지당 레코드 수   기본 10
       * countPage : 페이지의 리스트에서 보여줄 페이지 갯수 보통 5 or 10
       * totalCount : 게시판 테이블의 총 레코드 건수
       */
      int totalPage = totalCount / countList;   // 전체 나와야할 페이지의 수
      
      if(totalCount % countList > 0) {
         totalPage++;
      }
      
      if(totalPage < page) {
         
      }
      
      int startPage = ((page - 1) / countPage) * countPage + 1;   // page 에 -1을 빼고, 마지막 결과에 +1을 하는 것은, 1과 10페이지 에서의 문제 때문이다.
      int endPage = startPage + countPage - 1;
      
      if(endPage > totalPage) {
         endPage = totalPage;
      }
      
      int start = (page - 1) * countList + 1;
      int end = start + countList - 1;
      if(end > totalCount) end = totalCount;
      
      config.put("totalCount", totalCount);
      config.put("totalPage", totalPage);
      config.put("startPage", startPage);
      config.put("endPage", endPage);
      config.put("start", start);
      config.put("end", end);
      config.put("page", page);
      config.put("countPage", countPage);
      
   }
   
   public String getPaginationHtml(HttpServletRequest req, String[] params) {
      
      StringBuilder stringBuilder = new StringBuilder();
      StringBuilder paramStr = new StringBuilder();
      // boardMain.do?page=2
      for( String param : params ) {
         paramStr.append("&" + param + "=" + (req.getParameter(param) == null ? "" : req.getParameter(param)));
      };
      
      if(config.get("page") > 1) {
         stringBuilder.append("<a href='?page=" + (config.get("page") - 1) + paramStr + "' class=\"dir prev\"></a>\n");
      }
      
      if(config.get("startPage") > 1) {
         stringBuilder.append("<a href='?page=" + 1 + paramStr + "' class=\"dir first\"></a>\n");
      }
      
     stringBuilder.append("<ul class=\"clearfix\">"); 
     
      for(int i = config.get("startPage"); i <= config.get("endPage"); i++) {
         if(i == config.get("page")) {
            stringBuilder.append("<li class=\"on\"><a href='?page=" + i + paramStr + "'>" + i + "</a></li>\n");
         }else {					// class=\"on\" 위치 확인
            stringBuilder.append("<li><a href='?page=" + i + paramStr + "'>" + i + "</a></li>\n");
         }
      }

      stringBuilder.append("</ul>");
      
      if(config.get("endPage") < config.get("totalPage")) {
//         stringBuilder.append("<a href=\"?page=\" + config.get(\"totalPage\") + paramStr + \"\" class=\"dir last\">\" + config.get(\"totalPage\") + \"</a>\n");
      }
      
      if(config.get("page") < config.get("totalPage")) {
         stringBuilder.append("<a href='?page=" + (config.get("page") + 1) + paramStr + "' class=\"dir next\"></a>\n");
      }
      
      return stringBuilder.toString();
   }

}