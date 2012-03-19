/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ntb.bean;

import BeanInfo.News;
import Helpers.ThaoTacSession;


/**
 *
 * @author Nguyen Dang Hoan
 */
public class NewsDetailBean {
     private News news = new News();

    /** Creates a new instance of NewsDetailBean */
    public NewsDetailBean() {
         if (ThaoTacSession.layXuong("news") != null) {
            this.news = (News) ThaoTacSession.layXuong("news");
        }
    }

    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

}
