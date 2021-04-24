package com.electronics.service.impl;

import com.electronics.entity.CommentsEntity;
import com.electronics.repository.CommentsRepository;
import com.electronics.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService implements ICommentService {

    @Autowired
    CommentsRepository commentsRepo;

    @Override
    public List<CommentsEntity> getCommentProduct(long id) {
        List<CommentsEntity> list;
        try {
            list = commentsRepo.findByProduct_Id(id);
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public CommentsEntity addComment(CommentsEntity comments) {
        CommentsEntity newComment;
        try {
            newComment = commentsRepo.save(comments);
            return newComment;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public List<CommentsEntity> findAll() {
        List<CommentsEntity> list;
        try {
            list = commentsRepo.findAll();
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
