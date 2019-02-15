library flutter_wordpress;

import 'package:flutter_wordpress/constants.dart';
import 'links.dart';
import 'content.dart';
import 'guid.dart';
import 'title.dart';
import 'excerpt.dart';

class Post {
  int id;
  String date;
  String dateGmt;
  Guid guid;
  String modified;
  String modifiedGmt;
  String password;
  String slug;
//  String status;
  PostPageStatus status;
  String type;
  String link;
  Title title;
  Content content;
  Excerpt excerpt;
  int author;
  int featuredMedia;
//  String commentStatus;
  CommentStatus commentStatus;
//  String pingStatus;
  PostPingStatus pingStatus;
  bool sticky;
  String template;
//  String format;
  PostFormat format;
//  List<Null> meta;
  List<int> categories;
  List<int> tags;
  String permalinkTemplate;
  String generatedSlug;
  Links lLinks;

  Post(
      {this.id,
      this.date,
      this.dateGmt,
      this.guid,
      this.modified,
      this.modifiedGmt,
      this.password,
      this.slug,
      this.status,
      this.type,
      this.link,
      this.title,
      this.content,
      this.excerpt,
      this.author,
      this.featuredMedia,
      this.commentStatus,
      this.pingStatus,
      this.sticky,
      this.template,
      this.format,
//        this.meta,
      this.categories,
      this.tags,
      this.permalinkTemplate,
      this.generatedSlug,
      this.lLinks});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    password = json['password'];
    slug = json['slug'];
    if (json['status'] != null) {
      PostPageStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['status']) {
          status = val;
          return;
        }
      });
    }
//    status = json['status'];
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    content =
        json['content'] != null ? new Content.fromJson(json['content']) : null;
    excerpt =
        json['excerpt'] != null ? new Excerpt.fromJson(json['excerpt']) : null;
    author = json['author'];
    featuredMedia = json['featured_media'];
    if (json['comment_status'] != null) {
      CommentStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['comment_status']) {
          commentStatus = val;
          return;
        }
      });
    }
    if (json['ping_status'] != null) {
      PostPingStatus.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['ping_status']) {
          pingStatus = val;
          return;
        }
      });
    }
//    commentStatus = json['comment_status'];
//    pingStatus = json['ping_status'];
    sticky = json['sticky'];
    template = json['template'];
    if (json['format'] != null) {
      PostFormat.values.forEach((val) {
        if (enumStringToName(val.toString()) == json['format']) {
          format = val;
          return;
        }
      });
    }
//    format = json['format'];
    /*if (json['meta'] != null) {
      meta = new List<Null>();
      json['meta'].forEach((v) {
        meta.add(new Null.fromJson(v));
      });
    }*/
    categories = json['categories'].cast<int>();
    tags = json['tags'].cast<int>();
    permalinkTemplate = json['permalink_template'];
    generatedSlug = json['generated_slug'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['date_gmt'] = this.dateGmt;
    if (this.guid != null) {
      data['guid'] = this.guid.toJson();
    }
    data['modified'] = this.modified;
    data['modified_gmt'] = this.modifiedGmt;
    data['password'] = this.password;
    data['slug'] = this.slug;
//    data['status'] = this.status;
    data['status'] =
        this.status == null ? '' : enumStringToName(this.status.toString());
    data['type'] = this.type;
    data['link'] = this.link;
    if (this.title != null) {
      data['title'] = this.title.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    if (this.excerpt != null) {
      data['excerpt'] = this.excerpt.toJson();
    }
    data['author'] = this.author;
    data['featured_media'] = this.featuredMedia;
//    data['comment_status'] = this.commentStatus;
    data['comment_status'] = this.commentStatus == null
        ? ''
        : enumStringToName(this.commentStatus.toString());
//    data['ping_status'] = this.pingStatus;
    data['ping_status'] = this.pingStatus == null
        ? ''
        : enumStringToName(this.pingStatus.toString());
    data['sticky'] = this.sticky;
    data['template'] = this.template;
//    data['format'] = this.format;
    data['format'] =
        this.format == null ? '' : enumStringToName(this.format.toString());
    /*if (this.meta != null) {
      data['meta'] = this.meta.map((v) => v.toJson()).toList();
    }*/
    data['categories'] = this.categories;
    data['tags'] = this.tags;
    data['permalink_template'] = this.permalinkTemplate;
    data['generated_slug'] = this.generatedSlug;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}
