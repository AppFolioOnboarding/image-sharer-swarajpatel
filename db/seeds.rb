image_url_list = %w[https://sm.mashable.com/mashable_sea/photo/default/man-fakes-death-cat-q6u_2z9w.png
                    https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg
                    https://ichef.bbci.co.uk/news/660/cpsprodpb/37B5/production/_89716241_thinkstockphotos-523060154.jpg
                    https://www.culinaryschools.org/clipart/rubber-duck.png
                    https://clipartion.com/wp-content/uploads/2015/10/penguin-clip-art-black-and-white-free-clipart-images.png
                    http://www.clker.com/cliparts/0/9/7/f/12438872411928921148penguin5.svg.med.png
                    https://www.picgifs.com/clip-art/cartoons/pokemon/clip-art-pokemon-508076.jpg
                    http://images.clipartpanda.com/shark-clip-art-0006259_Clip_Art.png
                    http://clipart-library.com/newimages/clip-art-images-54.jpg
                    http://cliparts.co/cliparts/Bcg/rpK/BcgrpKMLi.png
                    http://clipart-library.com/newimages/birthday-clip-art-3.jpg
                    https://i.pinimg.com/originals/68/6f/71/686f71a335454045a6c6e3e9d8fa95a2.png
                    http://clipart-library.com/newimages/dog-clip-art-17.jpg
                    https://ijcnlp2008.org/images/1-clipart-unit-4.png
                    http://clipart-library.com/newimages/clip-art-images-57.png
                    https://classroomclipart.com/images/gallery/Clipart/Animals/Reptile_Clipart/Turtle_Clipart/TN_green-similing-tortoise-clipart-615.jpg
                    https://st.depositphotos.com/1216158/3267/v/950/depositphotos_32676701-stock-illustration-sun-clipart.jpg
                    http://images.clipartpanda.com/grape-clip-art-bunch-green-grapes-free-clip-art-funny_4871765300937198.jpg
                    https://illustoon.com/photo/2317.png
                    https://static8.depositphotos.com/1072020/914/v/950/depositphotos_9145170-stock-illustration-vector-soccer-ball-clipart.jpg]

image_url_list.each do |image_url|
  Image.create(url: image_url)
end
