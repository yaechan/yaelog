# -*- coding: utf-8 -*-

Entry.create({
  author: Member.find_by_name("Yae"),
  title: "ぴよぴよ開発日記",
  body: "どうも。\nやえです。\n最近はRailsの勉強しています。\n早くRails、あるいはRubyのプログラマです、って自信を持って言えるようになりたい。\nということでとりあえず頑張ります。\n気合いだー！",
  category: "test",
  posted_at: Date.new(2013, 1, 1),
  status: "draft"
}, without_protection: true)