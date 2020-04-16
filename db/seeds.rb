# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

max_friends_count = 200
user_password = '123456'
user_list = [
  ['James Holloway', 'james@gmail.com'],
  ['Sarah Cathouse', 'sarah@gmail.com'],
  ['Jimmy Jam', 'jimmy@gmail.com'],
  ['Easton Nikolaus', 'Easton@gmail.com'],
  ['Brant Hane', 'Brant@gmail.com'],
  ['Clifton Connelly', 'Clifton@gmail.com'],
  ['Genevieve Turcotte', 'Genevieve@hotmail.com'],
  ['Andres Baumbach', 'Andres@yahoo.co.uk'],
  ['Delia Renner', 'Delia@hotmail.com'],
  ['Luciano Rowe', 'Luciano@gmail.com'],
  ['Letha Sauer', 'Letha@gmail.com'],
  ['Dolores Yundt', 'Dolores@hotmail.com'],
  ['Anais Farrell', 'Anais@gmail.com'],
  ['Nicholaus Kutch', 'Nicholaus@gmail.com'],
  ['Zechariah Leffler', 'Zechariah@yahoo.co.uk'],
  ['Rosa Cruickshank', 'Rosa@gmail.com'],
  ['Vergie Becker', 'Vergie@gmail.com'],
  ['Clara Ryan', 'Clara@gmail.com'],
  ['Vita Erdman', 'Vita@hotmail.com'],
  ['Bernadette Beahan', 'Bernadette@gmail.com'],
  ['Jerad Marquardt', 'Jerad@gmail.com'],
  ['Diego Harris', 'Diego@gmail.com'],
  ['Merle Maggio', 'Merle@gmail.com']
]

post_list = [
  'Sagittis pulvinar magnis ornare vel commodo cursus',
  'Cubilia viverra posuere hendrerit fermentum vitae blandit',
  'Mauris purus potenti laoreet felis fusce gravida cursus sem, lacus fames nulla cubilia interdum justo imperdiet per, tristique etiam nunc diam penatibus ullamcorper vestibulum. Erat augue suscipit morbi eleifend luctus id metus felis etiam sollicitudin, ad dui maecenas sagittis massa ut rutrum pretium penatibus, laoreet tristique nullam facilisis faucibus tempus eget egestas cras. Consequat nascetur luctus dui sollicitudin sem urna eget, pellentesque vel posuere purus porta.',
  'Laoreet volutpat condimentum dictumst rutrum venenatis, nisl cursus accumsan enim, inceptos iaculis cum neque. Ultrices semper consectetur mollis tristique sed aenean hendrerit, consequat ipsum tincidunt ornare ridiculus eros etiam curae, conubia nunc porta inceptos metus blandit. Consectetur diam porta ante sit vel luctus ullamcorper ut suscipit, nibh morbi egestas etiam commodo ad donec enim fusce velit, curabitur faucibus malesuada bibendum quam dictum ridiculus felis.',
  'Rhoncus cursus augue magnis pretium dictumst ridiculus dolor, elit lobortis purus tempor nulla blandit, mollis class turpis eros id pharetra. Dignissim proin aenean aptent taciti ornare vulputate lacinia condimentum felis turpis litora, aliquam nulla habitant risus nostra nisi cursus torquent dui cum, conubia rutrum laoreet himenaeos tortor ullamcorper lectus ac quisque parturient. Curabitur venenatis conubia duis dapibus adipiscing blandit bibendum, scelerisque nibh cursus rhoncus per luctus.',
  'Maecenas aenean faucibus egestas curae etiam vehicula donec ligula semper sapien parturient magnis turpis, amet felis aliquet congue lacinia fusce imperdiet in cubilia ac dis euismod. Mi fringilla nostra rutrum mollis lorem pellentesque eros, inceptos hendrerit nisl sem sociosqu dictum, nulla sapien ornare commodo scelerisque magna. Nullam lacinia fringilla mollis pulvinar iaculis euismod curae montes per, scelerisque eu id venenatis tempor maecenas dui ultricies litora, lectus sociosqu ad nostra faucibus ut himenaeos phasellus.',
  'Nisi venenatis cum malesuada vehicula ultricies proin, sodales nibh sollicitudin dis commodo porta, parturient hac habitant vestibulum diam. Libero auctor neque dui quisque vehicula class ipsum litora integer ante rhoncus, placerat feugiat vulputate penatibus etiam per enim praesent vitae turpis. Lectus netus enim molestie ac nulla fames proin, potenti donec auctor dignissim felis feugiat magnis risus, metus ante maecenas tempus neque augue.',
  'Penatibus in torquent nibh tempor etiam ut diam ullamcorper pellentesque per eros, montes placerat vulputate cras nunc euismod dictum mi integer eu rutrum, iaculis ad odio quisque semper purus lacinia tellus vehicula commodo. Etiam posuere nostra facilisi orci placerat enim curae ligula praesent, mus nullam sapien eleifend odio conubia nascetur gravida et ultrices, cras a facilisis habitasse varius augue ante luctus. Aenean primis suspendisse urna suscipit vulputate in eleifend dapibus, morbi sem potenti facilisi dolor purus condimentum et, vitae vivamus mattis sociosqu libero nibh sociis, nulla nascetur cubilia leo eros turpis taciti.',
  'Dis litora quis blandit odio adipiscing tempus, cum risus etiam ipsum in fermentum, ligula dictum molestie conubia vivamus. Arcu dignissim senectus dolor sagittis curabitur nulla euismod, sociosqu justo aliquam consequat nisl fringilla ipsum lectus, vel tincidunt ultricies ullamcorper condimentum adipiscing. Velit mus montes maecenas ac taciti libero mi elit arcu penatibus, fringilla suscipit feugiat pretium auctor conubia posuere est senectus.',
  'Risus phasellus blandit velit justo nunc ligula, inceptos lacus eleifend egestas sapien sed, dictumst elit a tincidunt vehicula. Tincidunt nascetur vivamus proin malesuada porttitor semper in arcu, inceptos urna morbi vestibulum eget nisl suspendisse montes, ligula mi magnis luctus hendrerit ridiculus justo. Id lacus tristique cubilia cursus potenti morbi ultrices molestie suscipit vitae, torquent facilisis tincidunt amet ornare maecenas sodales euismod ante, felis magna nisl justo hendrerit metus erat dapibus nulla.',
  'Cum nascetur justo eros massa dictumst luctus gravida molestie tellus nullam, erat dictum venenatis turpis orci vestibulum ultrices inceptos proin, vehicula accumsan nisl augue condimentum leo cubilia commodo ultricies. Penatibus turpis mi eu mollis odio facilisis sagittis, magna arcu lorem per ornare mauris. Penatibus cum sagittis iaculis magna torquent eleifend dapibus porttitor, facilisi platea primis consectetur donec hendrerit sociis, blandit praesent ultrices proin urna volutpat fusce.',
  'Aptent nunc elementum augue id tincidunt parturient leo aenean taciti, feugiat praesent quisque vestibulum faucibus morbi semper a quis, euismod scelerisque pharetra lorem tristique duis aliquam magnis. Sollicitudin felis quam platea lorem est placerat elit amet, urna viverra condimentum aliquam porttitor risus per mollis habitasse, senectus laoreet leo eleifend ridiculus magna aptent. Mattis lorem commodo orci amet nostra nascetur inceptos, eleifend nec curae in tincidunt magnis, scelerisque iaculis aptent class ad dictumst.',
  'Adipiscing ante netus varius donec erat dolor lorem ornare habitant euismod nulla nam suspendisse, pulvinar aptent eleifend enim dictumst imperdiet fringilla curabitur nisi justo conubia. Tellus posuere odio lectus hendrerit feugiat aliquet viverra mollis ligula et, ullamcorper mattis torquent aenean urna ac sem arcu libero, pulvinar sit penatibus euismod montes malesuada venenatis scelerisque ridiculus. Tempus morbi mattis litora taciti convallis nisi dapibus suscipit ligula justo, tincidunt egestas mollis nascetur dis aenean blandit iaculis nam.',
  'Diam taciti congue magnis ornare mus urna nulla, nisi faucibus habitant adipiscing pretium etiam, donec turpis arcu mattis sed libero. Bibendum tincidunt nisi lectus imperdiet ultricies cubilia aliquet, justo condimentum consequat platea facilisis odio posuere, per dictum placerat luctus eleifend pellentesque. Luctus class ullamcorper condimentum pulvinar sed in velit primis quis turpis et felis dui adipiscing rutrum, nullam porttitor penatibus eu lacus urna potenti torquent ipsum donec integer ante elementum eleifend.',
  'Sollicitudin consequat nascetur est pharetra massa porta bibendum viverra, sodales vehicula netus rhoncus natoque tempus tempor vestibulum, proin sit tristique primis enim congue fames. Arcu vulputate convallis nostra facilisis porta quis donec egestas accumsan ultrices, in lorem vivamus sed adipiscing urna id feugiat sapien, eu nibh consectetur at molestie laoreet risus ullamcorper posuere. Rutrum eu porta dolor cubilia lectus leo sollicitudin donec etiam, quis bibendum quisque malesuada velit potenti maecenas gravida venenatis, tempus nostra tristique class aptent habitasse consequat feugiat.',
  'Eget integer tincidunt penatibus auctor viverra pretium risus quis gravida interdum sodales, potenti massa vivamus faucibus class leo per magnis morbi luctus. Eleifend nibh fermentum pellentesque donec quam sem varius eu, sociosqu etiam posuere bibendum aliquet penatibus vivamus dictumst integer, libero ligula a quis taciti in euismod. Duis tempor taciti congue magna iaculis cursus non sit sociis turpis, sodales facilisi aliquet egestas curabitur mi ac venenatis etiam, adipiscing bibendum amet dui conubia in dictum aptent viverra.',
  'Sem dignissim turpis arcu augue nunc nostra, primis urna pulvinar donec netus sociis habitasse, aptent congue erat dui massa. Leo nunc nulla mi litora quisque diam sagittis a conubia libero, nisl eros porta duis praesent per donec consectetur habitant facilisi, augue nascetur taciti sem erat magnis primis sapien fermentum. Enim eleifend scelerisque quisque arcu nostra conubia class, hendrerit pellentesque varius porttitor viverra phasellus morbi netus, risus cursus aenean suscipit a curae.',
  'Senectus rutrum aliquam praesent at litora cubilia adipiscing mauris, fringilla feugiat nisl amet est mi pharetra odio elit, sed viverra proin dolor aliquet pretium imperdiet. Ullamcorper at curabitur vel penatibus ultricies sit interdum himenaeos, faucibus congue ut scelerisque dictum magna volutpat, adipiscing nisi fusce rhoncus bibendum felis quisque. Tincidunt mattis lacus est vitae augue nibh dictum nunc enim odio, scelerisque cubilia non in aptent risus donec felis.',
  'Curae maecenas ac sollicitudin nibh netus auctor tempor mauris arcu luctus non class, ad justo sit donec purus quam primis lacus dolor mattis volutpat neque, facilisi nisi lorem dui felis accumsan cubilia per fames cras nisl. Tempor elementum sit venenatis ante commodo risus netus purus, dis pretium vivamus faucibus sodales natoque mus est ultricies, himenaeos maecenas nisl ullamcorper torquent ornare luctus. Taciti accumsan mi et pharetra torquent habitant orci, dictum dapibus sociis nunc purus consectetur ad, per montes aliquet scelerisque luctus sagittis.',
  'Montes curae lacinia potenti diam luctus amet nullam integer magna, purus parturient ullamcorper aptent est class dapibus imperdiet pellentesque, lobortis nostra rutrum dui elementum ac leo nam. Dictumst per hendrerit magna pretium sociis rutrum mi, id netus sem ridiculus blandit in ad, libero suscipit pharetra hac pellentesque taciti. Hendrerit ultrices justo urna pretium purus interdum, taciti luctus potenti volutpat amet, conubia commodo metus consequat rhoncus.',
  'Consequat vivamus id aenean primis natoque quam fusce, arcu quis turpis cras dolor mus nostra, tincidunt convallis inceptos donec libero ante. Nostra imperdiet ultricies mollis primis aptent viverra ac laoreet mus fames diam ligula semper, habitasse integer faucibus vulputate vel pretium cras id adipiscing sociosqu feugiat. Sem sit taciti convallis nullam maecenas litora dis sociosqu proin, habitant elit quam himenaeos accumsan semper scelerisque sollicitudin magna cubilia, penatibus aliquam congue pretium laoreet nibh tincidunt senectus.',
  'Dignissim et mi ipsum facilisis suscipit amet varius lectus fames consequat dis scelerisque mollis ullamcorper duis, iaculis quam consectetur dui feugiat sit ac nisi sed mus auctor fusce cum. Sodales nostra hendrerit torquent velit semper euismod nulla nunc mauris eget, sit laoreet congue luctus taciti purus curae tortor mi nam, venenatis dictum ad malesuada sed tincidunt potenti commodo molestie. Phasellus class amet eu nascetur dolor facilisi diam suscipit malesuada sem, laoreet condimentum posuere elementum convallis rutrum aptent accumsan aliquet, faucibus fermentum luctus dui potenti pellentesque nisi vestibulum scelerisque.',
  'Neque penatibus lacinia blandit scelerisque praesent lorem dui cum, mattis nibh sociosqu sed ad curae habitasse, cras varius facilisis litora vulputate etiam dignissim. Molestie bibendum sagittis pellentesque natoque justo luctus class tristique mattis, convallis sociosqu vestibulum felis ridiculus sed per ultrices blandit, commodo dui taciti montes potenti faucibus diam porta. Magnis tempor pellentesque egestas ad conubia est augue suscipit, laoreet vel imperdiet aliquam consectetur accumsan mollis lacinia, ligula lacus porttitor curae nisl nibh cubilia.',
  'Ac lobortis nascetur potenti eget vel, non pulvinar aliquet lorem tempor, praesent feugiat consequat in. Habitasse ultrices id quam porttitor phasellus commodo dolor faucibus tincidunt nulla tempor enim, pellentesque orci mattis per lorem convallis massa libero netus fringilla mi nam, ultricies eleifend quisque felis curabitur nisl tristique morbi facilisis bibendum velit. Non malesuada nibh ultricies purus porta aenean nam, tempor ultrices facilisis neque quisque magna, duis taciti cum molestie feugiat porttitor.',
  'Molestie cum quis cras habitasse non lobortis gravida viverra eleifend nec, nostra malesuada dolor platea parturient mus lectus justo suscipit, erat tristique mi imperdiet ut velit tellus accumsan consequat. Semper rhoncus augue vitae hac non ipsum vehicula pellentesque posuere rutrum facilisis, molestie a duis commodo enim varius inceptos diam tristique integer, placerat iaculis primis suspendisse adipiscing gravida libero mi vestibulum felis. Nisl ridiculus ultricies augue viverra ipsum molestie sagittis platea at mattis, venenatis morbi consequat justo porta sollicitudin cras sit duis, ligula mauris dis velit sociis egestas quam netus adipiscing.',
  'Sociosqu vulputate montes mauris imperdiet tempus lacus, class erat semper fermentum eros commodo, turpis purus augue eu condimentum. Fermentum vivamus sociosqu curae ad aliquam porttitor class diam, est leo curabitur congue porta posuere molestie, laoreet nunc eleifend vehicula cum semper lacus. Urna auctor fusce maecenas turpis mattis cubilia amet tincidunt vulputate sodales hendrerit netus mus, dis faucibus class potenti et sem morbi quisque dictum dictumst aliquam.',
  'Interdum malesuada augue facilisi duis nec pellentesque metus non ullamcorper dapibus, posuere mollis montes penatibus tempor tincidunt etiam amet faucibus, nibh arcu enim lacinia fringilla netus fames habitant class. Vehicula mus morbi bibendum conubia ultricies orci habitant quisque, hac elementum mi tristique ante at quis penatibus, fusce eleifend praesent rutrum parturient cum a. Dignissim venenatis sit libero egestas augue inceptos aenean auctor platea, euismod maecenas magnis leo fermentum mattis aliquet mauris nam ultrices, rhoncus nostra amet dictum habitant metus commodo bibendum.',
  'Nullam sagittis sociis egestas diam at elementum rhoncus platea, non donec primis malesuada consectetur curabitur dolor. Fames morbi justo aliquet varius accumsan ac dui cubilia, sodales quisque imperdiet lorem auctor tincidunt tempus mi, sociis nunc facilisis luctus augue tortor ultricies. Montes nam enim erat porttitor odio ipsum curae lacinia sollicitudin, id ad tellus parturient hendrerit mi praesent donec, eleifend mollis proin senectus morbi platea magnis tempor.',
  'Consequat praesent semper habitasse ad dignissim faucibus vestibulum blandit, aliquet interdum purus primis diam facilisi leo ullamcorper lacus, elementum elit etiam donec risus sollicitudin nostra. Montes mauris nisl dignissim phasellus aliquet nibh nullam risus morbi posuere fringilla duis convallis, habitasse orci hendrerit vivamus felis integer tempor etiam mattis fusce ad. Laoreet vulputate erat suscipit hendrerit parturient fringilla leo nullam arcu velit, ridiculus ornare nibh dictum facilisi dolor lacinia varius ligula.',
  'Habitant duis justo porta nisi leo mollis cubilia, tristique ornare viverra suscipit nascetur parturient, mi sem at lacinia euismod odio. Vulputate fusce rutrum mi nam vitae lorem cum, hac a sit vel penatibus tellus vehicula pharetra, eget donec nisl per ridiculus faucibus. Libero netus lobortis dignissim curabitur donec habitasse ornare cursus volutpat mollis himenaeos elit vulputate purus vehicula aenean at varius dictum, nascetur adipiscing luctus est natoque porttitor class mattis blandit penatibus ligula sit dis rutrum malesuada risus massa.',
  'Fringilla proin praesent sollicitudin viverra cubilia cum, consectetur vehicula vestibulum torquent natoque, vulputate eros tellus enim eu. Odio fermentum curae dolor tristique sociis auctor praesent scelerisque velit natoque, a ad sed hac sem pellentesque placerat tortor vitae ullamcorper himenaeos, magna amet aenean feugiat sociosqu ridiculus nibh interdum parturient. Vel luctus ornare mattis nam tellus ac nunc phasellus ipsum, dolor pulvinar dapibus volutpat sapien etiam nisi est per viverra, sollicitudin eros adipiscing habitant curabitur gravida penatibus leo.',
  'At sociosqu posuere libero venenatis donec auctor quisque taciti magnis, eget porta dis habitasse himenaeos congue mattis magna vitae, tristique nec cubilia duis ornare dui in ut. Mollis vulputate etiam mi aliquet lacinia duis luctus convallis elementum potenti, ullamcorper phasellus pharetra justo aenean augue nascetur platea id, lorem suspendisse pulvinar massa ultricies molestie condimentum leo quam. Senectus parturient aliquam euismod egestas pretium ac dolor augue pellentesque elementum, condimentum vestibulum diam risus mollis tempor pulvinar inceptos vivamus convallis sem, metus mus sociosqu ad nam fermentum fames dis cras.'
]

image_list = [
  'https://s3.eu-west-2.amazonaws.com/acebook-untitled/posts/photos/000/000/033/medium/props.png?1587053919'
]

# max number of friendships that are created between users

# populates users with identical passwords
user_list.each do |name, email|
  User.create( name: name, email: email, password: user_password )
end

# create list of user ids for convenience and performance
user_id_list = user_list.map { |name, _| User.find_by(name: name).id }

# populates posts with random authors
post_list.each do |message|
  Post.create( message: message, user_id: user_id_list.sample )
end

# populates friends with random friends
max_friends_count.times do
  a = user_id_list.sample
  b = user_id_list.sample
  # unless already friends or friend is yourself
  unless a == b || Friendship.find_by(user_id: a, friend_id: b) != nil || Friendship.find_by(user_id: b, friend_id: a) != nil
    Friendship.create( user_id: a, friend_id: b)
    Friendship.create( user_id: b, friend_id: a)
  end
end