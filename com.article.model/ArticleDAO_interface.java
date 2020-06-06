package com.article.model;

import java.util.List;
import java.util.Set;


public interface ArticleDAO_interface {
	 public void insert(ArticleVo articleVo);
     public void update(ArticleVo articleVo);
     public void delete(Integer artNo);
     public ArticleVo findByPrimaryKey(Integer artno);
     public List<ArticleVo> getAll();
     //查詢討論區文章編號(回傳 Set)
     public Set<ArticleVo> getArtNoByArticle(Integer artno);
}
