# -*- coding: utf-8 -*-

0.upto(9) do |idx|
  Entry.create({
  	author: Member.find_by_name("Yae"),
  	title: "ぴよぴよ開発日記#{idx}",
  	body: "どうも。\nやえです。\n最近は職場でもRailsの環境を整えて開発の勉強しています。\n早くRails、あるいはRubyのプログラマです、って自信を持って言えるようになりたい。\nということでとりあえず頑張ります。\n気合いだー！",
  	category: %w(Rails Ruby その他)[idx % 3],
  	posted_at: 10.days.ago.advance(days: idx),
  	status: %w(draft public)[idx % 2]
  	}, without_protection: true)
end