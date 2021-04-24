package com.electronics.service;

import com.electronics.entity.CommentsEntity;

import java.util.List;

public interface ICommentService {
    List<CommentsEntity> getCommentProduct(long id);

    CommentsEntity addComment(CommentsEntity comments);

    List<CommentsEntity> findAll();

}
