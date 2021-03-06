<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_layout"/>
	</head>
	<body>

    <!-- BEGIN BREADCRUMBS -->   
    <div class="row-fluid breadcrumbs margin-bottom-40">
        <div class="container">
            <div class="span4">
                <h1>Blog Item</h1>
            </div>
            <div class="span8">
                <ul class="pull-left breadcrumb">
                    <li><a href="index-2.html">Home</a> <span class="divider">/</span></li>
                    <li><a href="#">Pages</a> <span class="divider">/</span></li>
                    <li class="active">Blog Item</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- END BREADCRUMBS -->

    <!-- BEGIN CONTAINER -->   
    <div class="container min-hight">
        <!-- BEGIN BLOG -->
        <div class="row-fluid">
            <!-- BEGIN LEFT SIDEBAR -->            
            <div class="span9 blog-item margin-bottom-40">
                <div class="blog-item-img">
                    <!-- BEGIN CAROUSEL -->            
                    <div class="front-carousel">
                        <div id="myCarousel" class="carousel slide">
                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="active item">
                                    <img src="${resource(dir: 'assets/img/posts', file: 'img1.jpg')}" alt="" />
                                </div>
                                <div class="item">
                                    <!-- BEGIN VIDEO -->   
                                    <iframe src="http://player.vimeo.com/video/56974716?portrait=0" height="259" style="width:100%; border:0" allowFullScreen></iframe>
                                    <!-- END VIDEO -->   
                                </div>
                                <div class="item">
                                     <img src="${resource(dir: 'assets/img/posts', file: 'img3.jpg')}" alt="" />
                                </div>
                            </div>
                            <!-- Carousel nav -->
                            <a class="carousel-control right" href="#myCarousel" data-slide="prev">
                                <i class="icon-angle-left"></i>
                            </a>
                            <a class="carousel-control left" href="#myCarousel" data-slide="next">
                                <i class="icon-angle-right"></i>
                            </a>
                        </div>                
                    </div>
                    <!-- END CAROUSEL -->             
                </div>
                <h2><a href="#">Corrupti quos dolores etquas</a></h2>
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui sint blanditiis prae sentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing condimentum eleifend enim a feugiat.</p>
                <blockquote>
                    <p>Pellentesque ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante Integer posuere erat a ante.</p>
                    <small>Someone famous <cite title="Source Title">Source Title</cite></small>
                </blockquote>                
                <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
                <p>Culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero consectetur adipiscing elit magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat. Pellentesque viverra vehicula sem ut volutpat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut non libero magna. Sed et quam lacus. Fusce condimentum eleifend enim a feugiat.</p>
                <ul class="blog-info">
                    <li><i class="icon-user"></i> By admin</li>
                    <li><i class="icon-calendar"></i> 25/07/2013</li>
                    <li><i class="icon-comments"></i> 17</li>
                    <li><i class="icon-tags"></i> Metronic, Keenthemes, UI Design</li>
                </ul>
                <div class="media">
                    <h3>Comments</h3>
                    <a href="#" class="pull-right">
                       <img src="${resource(dir: 'assets/img/people', file: 'img1-small.jpg')}" alt="" class="media-object"/>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Media heading <span>5 hours ago / <a href="#">Reply</a></span></h4>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                        <hr>
                        <!-- Nested media object -->
                        <div class="media">
                            <a href="#" class="pull-right">                           
                            <img src="${resource(dir: 'assets/img/people', file: 'img2-small.jpg')}" alt="" class="media-object"/>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Media heading <span>17 hours ago / <a href="#">Reply</a></span></h4>
                                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                            </div>
                        </div>
                        <!--end media-->
                        <hr>
                        <div class="media">
                            <a href="#" class="pull-right">
                            <img src="${resource(dir: 'assets/img/people', file: 'img3-small.jpg')}" alt="" class="media-object"/>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Media heading <span>2 days ago / <a href="#">Reply</a></span></h4>
                                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                            </div>
                        </div>
                        <!--end media-->
                    </div>
                </div>
                <!--end media-->
                <div class="media">
                    <a href="#" class="pull-right">                   
                    <img src="${resource(dir: 'assets/img/people', file: 'img4-small.jpg')}" alt="" class="media-object"/>
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading">Media heading <span>July 25,2013 / <a href="#">Reply</a></span></h4>
                        <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                    </div>
                </div>
                <!--end media-->
                <hr>
                <div class="post-comment">
                    <h3>Leave a Comment</h3>
                    <form>
                        <label>Name</label>
                        <input type="text" class="span7 m-wrap">
                        <label>Email <span class="color-red">*</span></label>
                        <input type="text" class="span7 m-wrap">
                        <label>Message</label>
                        <textarea class="span10 m-wrap" rows="8"></textarea>
                        <p><button class="btn theme-btn" type="submit">Post a Comment</button></p>
                    </form>
                </div>
            </div>
            <!-- END LEFT SIDEBAR -->

            <!-- BEGIN RIGHT SIDEBAR -->            
            <div class="span3 blog-sidebar">
                <!-- BEGIN RECENT NEWS -->                            
                <h2>Recent News</h2>
                <div class="recent-news margin-bottom-10">
                    <div class="row-fluid margin-bottom-10">
                        <div class="span3">
                            <img src="${resource(dir: 'assets/img/people', file: 'img2-large.jpg')}" alt=""/>                      
                        </div>
                        <div class="span9 recent-news-inner">
                            <h3><a href="#">Letiusto gnissimos</a></h3>
                            <p>Decusamus tiusto odiodig nis simos ducimus qui sint</p>
                        </div>                        
                    </div>
                    <div class="row-fluid margin-bottom-10">
                        <div class="span3">
                            <img src="${resource(dir: 'assets/img/people', file: 'img1-large.jpg')}" alt=""/>                         
                        </div>
                        <div class="span9 recent-news-inner">
                            <h3><a href="#">Deiusto anissimos</a></h3>
                            <p>Decusamus tiusto odiodig nis simos ducimus qui sint</p>
                        </div>                        
                    </div>
                    <div class="row-fluid margin-bottom-10">
                        <div class="span3">
                            <img src="${resource(dir: 'assets/img/people', file: 'img3-large.jpg')}" alt=""/>                        
                        </div>
                        <div class="span9 recent-news-inner">
                            <h3><a href="#">Tesiusto baissimos</a></h3>
                            <p>Decusamus tiusto odiodig nis simos ducimus qui sint</p>
                        </div>                        
                    </div>
                </div>
                <!-- END RECENT NEWS -->                            

                <!-- BEGIN BLOG TALKS -->
                <div class="blog-talks margin-bottom-30">
                    <h2>Popular Talks</h2>
                    <div class="tab-style-1">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab-1" data-toggle="tab">Multipurpose</a></li>
                            <li><a href="#tab-2" data-toggle="tab">Documented</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane row-fluid fade in active" id="tab-1">
                                <p class="margin-bottom-10">Raw denim you probably haven't heard of them jean shorts Austin. eu banh mi, qui irure terry richardson ex squid Aliquip placeat salvia cillum iphone.</p>
                                <p><a href="#" class="read-more">Read more</a></p>
                            </div>
                            <div class="tab-pane fade" id="tab-2">
                                <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. aliquip jean shorts ullamco ad vinyl aesthetic magna delectus mollit. Keytar helvetica VHS salvia..</p>
                            </div>
                        </div>
                    </div>
                </div>                            
                <!-- END BLOG TALKS -->

                <!-- BEGIN BLOG PHOTOS STREAM -->
                <div class="blog-photo-stream margin-bottom-20">
                    <h2>Photos Stream</h2>
                    <ul class="unstyled">
                        <li><a href="#"><img src="${resource(dir: 'assets/img/people', file: 'img5-small.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/works', file: 'img1.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/people', file: 'img4-large.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/works', file: 'img6.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/pics', file: 'img1-large.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/pics', file: 'img2-large.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/works', file: 'img3.jpg')}" alt=""/></a></li>
                        <li><a href="#"><img src="${resource(dir: 'assets/img/people', file: 'img2-large.jpg')}" alt=""/></a></li>
                    </ul>                    
                </div>
                <!-- END BLOG PHOTOS STREAM -->

                <!-- BEGIN BLOG TAGS -->
                <div class="blog-tags margin-bottom-20">
                    <h2>Tags</h2>
                    <ul>
                        <li><a href="#"><i class="icon-tags"></i>OS</a></li>
                        <li><a href="#"><i class="icon-tags"></i>Metronic</a></li>
                        <li><a href="#"><i class="icon-tags"></i>Dell</a></li>
                        <li><a href="#"><i class="icon-tags"></i>Conquer</a></li>
                        <li><a href="#"><i class="icon-tags"></i>MS</a></li>
                        <li><a href="#"><i class="icon-tags"></i>Google</a></li>
                        <li><a href="#"><i class="icon-tags"></i>Keenthemes</a></li>
                        <li><a href="#"><i class="icon-tags"></i>Twitter</a></li>
                    </ul>
                </div>
                <!-- END BLOG TAGS -->
            </div>
            <!-- END RIGHT SIDEBAR -->            
        </div>
        <!-- END BEGIN BLOG -->
    </div>
    <!-- END CONTAINER -->

</body>
<!-- END BODY -->

</html>