<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.ecommerce.model.dao.*" %>
<!DOCTYPE html>
<html>



<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Amazing</title>
    <link rel = "icon" href = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/900px-Amazon_icon.svg.png?20210720180728" type = "image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    
</head>
<body>


<%
	Cookie[] cookies = request.getCookies();
   	String values=null, email = null,name=null, uid=null, cart=null;
   	String newname=null;
    for (Cookie cookie : cookies) {
       if (cookie.getName().equals("email")) {
            values = cookie.getValue();
            String[] newvalues = values.split("__");
            //System.out.println(newvalues[0]);
            email=newvalues[0];
            name=newvalues[1];
            uid=newvalues[2];
            cart=newvalues[3];
            name=name.replace("_"," ");
            
            if(name.length()<7){
            	newname=name;
            }
            else{newname=name.substring(0,7);}
         	break;
        }
    }
    
    UserDao ud=new UserDao();
    ResultSet rs1=ud.info(email);
    while(rs1.next()){
    	cart=rs1.getString(5);
    }
    String str=request.getParameter("msg");
    %>
	
<%if("buysucess".equals(str)){ %>
<script>
    alert("Order placed, enjoy shopping.");
</script>
<%}%>

    <nav class="nav bg-blue">
        <a href="#" class="navbox">
            <img src="./logo dark.png" alt="" width="150" height="50" class="img-fluid">
        </a>
        <a href="#" class="navbox">
            <div class="address">
                <span class="location-img">
                    <svg class="white" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 384 512"><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
                </span>
                <span class="address-word">
                    <span style="color: rgba(255, 255, 255, 0.621)"> Home </span>
                    <p id="dark-theme" class="navtext">Select your address</p>
                </span>
            </div>
        </a>
        <div class="searchbar">
            <form class="compact">
                <span class="dropdown">
                    <button class="btn btn-light srch dropdown-toggle" type="button" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      All
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <a class="dropdown-item" href="#">All categories</a>
                      <a class="dropdown-item" href="#">Accesories</a>
                      <a class="dropdown-item" href="#">Electronics</a>
                    </div>
                </span>
                <input class="searchbox" type="text" placeholder="Search amazon.in">
                <button class="btn yellow">
                    <svg class="black" xmlns="http://www.w3.org/2000/svg" height="1.4em" viewBox="0 0 512 512"><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                </button>           
            </form>
        </div>
        <span class="dropdown navbox">
            <a class="white" style="text-decoration: none;" class="dropdown-toggle" type="button" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <img src="https://img.icons8.com/?size=512&id=32584&format=png" height="25px" width="27px">
              <span class="lang">EN</span>
              <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
              <a class="dropdown-item" href="#">English</a>
              <a class="dropdown-item" href="#">Bengali</a>
              <a class="dropdown-item" href="#">Hindi</a>
            </div>
        </span>
        <span class="dropdown navbox">
            <a style="text-decoration: none;" class="white" class="dropdown-toggle" type="button" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <% if (email == null) {%>
              <span class="rel">Hello, sign in</span>
              <span class="lang">Account & list</span>
              <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span>
            </a>
            <div class="dropdown-menu log-drop" >
              <a href="login.jsp" class="dropdown-item signin">Sign in</a>
              <p class="signup">New customer?<a href="register.jsp">Register</a></p>
            </div>
            <% }else{ %>
            <span class="rel">Hello, <%= newname %>...</span>
              <span class="lang">Account & list</span>
              <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span>
            </a>
            <div class="dropdown-menu log-drop" >
            	<div class="details">Email: <%= email %></div>
            	<div class="details">Name: <%= name %></div>
            	<div class="details">Username: <%= uid %></div>
              <a class="dropdown-item signina lend" href="logout.jsp">Log Out</a>
            </div>
            <%} %>
        </span>
        <a href="#" class="navbox">
            
                <span class="return">
                    <span style="color: rgba(255, 255, 255, 0.621)"> Returns</span>
                    <p class="lang">& Orders</p>
                </span>
            
        </a>
        <a href="cart.jsp" class="navbox">
                <div class="num">
                <%if(cart==null){ %>
                0
                <%}else{ %>
                    <%=cart %>
                    <%} %>
                </div>
                <span>
                    <svg class="white a-cart" xmlns="http://www.w3.org/2000/svg" height="1.6em" viewBox="0 0 576 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/></svg>
                </span>
                <span>
                    <span style="color: white;">&nbsp;Cart </span>
                </span>
        </a>

    </nav>
    <div id="start" class="temp">

    </div>
    <div class="navbottom">
        <a href="product.jsp" class="box"><div>
            <svg class="white" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z"/></svg>
            <span>All</span>
        </div></a>
        <a href="product.jsp" class="box"><div>Amazon miniTV</div></a>
        <a href="product.jsp" class="box"><div>Sell</div></a>
        <a href="product.jsp" class="box"><div>Best Sellers</div></a>
        <a href="product.jsp" class="box"><div>Today's Deals</div></a>
        <a href="product.jsp" class="box"><div>Mobiles</div></a>
        <a href="product.jsp" class="box"><div>New Releases</div></a>
        <a href="product.jsp" class="box"><div>Customer Service</div></a>
        <a href="product.jsp" class="box"><div>Prime <span><svg class="white" xmlns="http://www.w3.org/2000/svg" height=".7em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg></span></div></a>
        <a href="product.jsp" class="nav-banner">
            <!-- <div>New Launches from Mobiles, Electronics & more | Shop now</div> -->
            <img class="box" src="./navad.png" alt="" width="400px">
        </a>
    </div>
    <div class="main">
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Toys/GW/GW-Hero-PC_BBAug23_Soft-toys_with-Apay_Lifestyle_2x._CB597740150_.jpg" class="d-block w-100" alt="..."></a>
              </div>
              <div class="carousel-item">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img23/Softlines_JWL_SH_GW_Assets/UNREC/V2_CAT_PC-2_3000._CB598805423_.jpg" class="d-block w-100" alt="..."></a>
              </div>
              <div class="carousel-item">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img12/OHL/Central/BAU/Aug/PC_hero_1_2x-2._CB598178405_.png" class="d-block w-100" alt="..."></a>
              </div>
              <div class="carousel-item">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/Shreyansh/BAU/Unrexc/D70978891_INWLD_BAU_Unrec_Uber_PC_Hero_3000x1200._CB594707876_.jpg" class="d-block w-100" alt="..."></a>
              </div>
              
              <div class="carousel-item">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img23/Fashion/GW/July/AUSmall/AF-Unrec-3000._CB600722535_.jpg" class="d-block w-100" alt="..."></a>
              </div>
              <div class="carousel-item">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img2020/img21/apparelGW/julyatf23/unrec/AU/KA_3000._CB600727166_.jpg" class="d-block w-100" alt="..."></a>
              </div>
              <div class="carousel-item">
                <a href="product.jsp"><img src="https://images-eu.ssl-images-amazon.com/images/G/31/img23/Beauty/GW/ATF/Haircare-Herofader-PCiew._CB597783118_.jpg" class="d-block w-100" alt="..."></a>
              </div>
            </div>
            <a class="carousel-control-prev car-btn" href="#carouselExampleControls" role="button" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only"></span>
            </a>
            <a class="carousel-control-next car-btn" href="#carouselExampleControls" role="button" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only"></span>
            </a>
        </div>

        <div class="content">
                <div class="box-content">
                    <div class="inner-box-top">
                        Up to 60% off | Styles for men
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PF_MF/MF-1-372-232._SY232_CB636110853_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="#"><p>Clothing</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PF_MF/MF-3-372-232._SY232_CB636110853_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Watches</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PF_MF/MF-2-372-232._SY232_CB636110853_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="#"><p>Footwear</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PF_MF/MF_4-372-232._SY232_CB636110853_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="#"><p>Bags & luggage</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See all offers</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Up to 70% off | Clearance store
                    </div>
                    <div class="inner-box-mid">
                        <a href="product.jsp"><img class="fullimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Electronics/Clearance/Clearance_store_Desktop_CC_2x._SY608_CB628315133_.jpg" alt=""></a>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See more</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Bluetooth Calling Smartwatch starts at...
                    </div>
                    <div class="inner-box-mid">
                        <a href="product.jsp"><img class="fullimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wearables/PC_CategoryCard_758X608_1._SY608_CB614835787_.jpg" alt=""></a>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">Shop now</a>
                    </div>
                </div>
                <div class="box-content bg-transparent">
                    <div class="smallbox-top">
                        <div class="halfbox">
                        <%if(email==null){ %>
                            Sign in for your best experience
                            <%}else{ %>
                            Shop products of your choice
                        <%} %>
                        </div>
                        <div>
                         <%if(email==null){ %>
                            <a href="login.jsp" style="text-decoration:none;"><button class="signin-btn signin">Sign in securely</button></a>
                            <%}else{ %>
                            <a href="product.jsp" style="text-decoration:none;"><button class="signin-btn signin">Enjoy Shopping</button></a>
                         <%} %>
                        </div>                    
                    </div>
                    <div class="smallbox-bottom">
                        <a href="product.jsp">
                            <img class="bottomimg" src="https://m.media-amazon.com/images/G/31/img19/AMS/Houseads/Laptops-Sept2019._CB436595915_.jpg" height="249.6" width="290" alt="">
                        </a>
                    </div>
                </div>
            
            <div class="content context-row">
                <div class="box-content">
                    <div class="inner-box-top">
                        Revamp your home in style
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/IMG20/Home/2021/GW/MSO/April/372x232_1_High._SY232_CB670263840_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Bedsheets, curtains & more</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/IMG20/Home/2021/GW/MSO/April/372x232_3_High._SY232_CB670263840_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Home storage</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/I/41PeDCV5wIL._AC_SX368_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Home decoration</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://m.media-amazon.com/images/I/41ssl8dwVCL._AC._SR360,460.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Lighting solutions</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See all offers</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Appliances for your home | Up to 55% off
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/IMG15/Irfan/GATEWAY/MSO/Appliances-QC-PC-372x232----B08RDL6H79._SY232_CB667322346_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Air conditioners</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/IMG15/Irfan/GATEWAY/MSO/B07G5J5FYP._SY232_CB667322346_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Microwaves</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/IMG15/Irfan/GATEWAY/MSO/B08345R1ZW---372x232._SY232_CB667322346_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Refrigerators</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/IMG15/Irfan/GATEWAY/MSO/Appliances-QC-PC-186x116--B08CPQVLZT._SY232_CB667322346_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Washing machines</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">Explore all</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Automotive essentials | Up to 60% off
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img17/Auto/2020/GW/PCQC/Glasscare2x._SY232_CB410830552_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Cleaning accesories</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img17/Auto/2020/GW/PCQC/Vega_helmet_372x232._SY232_CB405083904_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Helmets</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img17/Auto/2020/GW/PCQC/Rim_tyrecare2x._SY232_CB410830552_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Tier & rim care</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img17/Auto/2020/GW/PCQC/Vaccum2x._SY232_CB410830555_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Vacuum cleaner</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See more</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Up to 60% off | Styles for women
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PC_WF/WF1-372-232._SY232_CB636048992_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Women's clothing</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PC_WF/WF4-372-232._SY232_CB636048992_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Watches</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PC_WF/WF2-372-232._SY232_CB636048992_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Footwear+Handbags</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Fashion/Gateway/BAU/BTF-Refresh/May/PC_WF/WF3-372-232._SY232_CB636048992_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Fashion jewellery</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See all offers</a>
                    </div>
                </div>
            </div>   
        </div>
        <div class="sliding-window">
            <div class="upper-slide">
                <span class="text">Today’s Deals&nbsp;</span>
                <span><a class="tdown blue" href="product.jsp">See all deals</a></span>
            </div>
            <div class="mid-window">
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/51dtEUJ0gbL._AC_SY400_.jpg" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            Up to 49% off
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        Starting 299 - ASIAN Footwear...
                    </div>
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/71k56DG8hsL._AC_SY400_.png" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            Up to 25% off
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        Best offers on FixDerma
                    </div>
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/51kdwtY1KvL._AC_SY400_.jpg" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            Up to 86% off
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        Wallpapers from wolpin
                    </div>
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/31J0hoR2SpL._AC_SY400_.jpg" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            &#8377;499 and under
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        Top Deals on Accesories
                    </div>
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/31i8GB3mD2L._AC_SY400_.jpg" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            Up to 40% off
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        WaterScience best deals Bath...
                    </div>
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/41uyuBjC53L._AC_SY400_.jpg" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            Up to 40% off
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        Best Offers on Paragon footwear
                    </div>
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/41lzeiq75FL._AC_SY400_.jpg" alt="" class="slide-img">
                    <div class="slide-text">
                        <span class="slide-text-offer">
                            Up to 19% off
                        </span>
                        <span class="slide-text-deals">
                            Deal of the day
                        </span>
                    </div>
                    <div class="slide-content-description">
                        VIP vests at best price ever
                    </div>
                </a>
            </div>
        </div>
        <div class="sliding-window window-down window-pic">
            <div class="upper-slide">
                <span class="text">Up to 70% off | Decorate your home as per you now&nbsp;</span>
                <span><a class="tdown blue tright1" href="product.jsp">See all offers</a></span>
            </div>
            <div class="pic-window">
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/61+5ukDxJfL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/51KYEYoJ+hL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/81R5EAUi09S._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/61I75V9jbvL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/61uTQSDyaZL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/616EyYiIO4L._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/713TsCmJyPL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/71k-LP4useS._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/51BeYs2vLRL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/71t7gB6RdqS._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/41VFHc-lFcL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/610Lg50d1KL._SX679_.jpg" alt="" class="slide-pic">
                </a>
            </div>
        </div>
        <div class="sliding-window window-down2 window-pic">
            <div class="upper-slide">
                <span class="text">Curated kitchen products from women-led business&nbsp;</span>
                <span><a class="tdown blue tright1" href="product.jsp">See all offers</a></span>
            </div>
            <div class="pic-window">
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/51MwAW6CsBL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/51lp7FDDSJL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/41e59B4JccL._SX300_SY300_QL70_FMwebp_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/91dlOL8wI7L._AC_SY200_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/91KeX8eRcjL._SL1500_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/81PoU8gkKGL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/61R7qqjSpkL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/81LZmESnkdL._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/816bbo0Rp9L._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
                <a href="product.jsp" class="slide-content">
                    <img src="https://m.media-amazon.com/images/I/81eKY6HhVML._AC_SY400_.jpg" alt="" class="slide-pic">
                </a>
            </div>
        </div>
        <div class="content">            
            <div class="content context-row window-down3">
                <div class="box-content">
                    <div class="inner-box-top">
                        Minimum 50% off | Top styles for her
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img2020/img21/kids/WRS_Dec22/PC_QC/WA/1_2X._SY232_CB618751254_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Allen Solly, Fort Collins & more</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img2020/img21/kids/WRS_Dec22/PC_QC/WA/3_2X._SY232_CB618751254_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Womanista, Mimosa & more</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img2020/img21/kids/WRS_Dec22/PC_QC/WA/2_2X._SY232_CB618751254_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Biba, Aurelia & more</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img2020/img21/kids/WRS_Dec22/PC_QC/WA/4_2X._SY232_CB618751254_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Harpa, Only & more</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See all deals</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Electronics devices for home office
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img21/PC/Computers/GW/DBQC/D21343116_IN_CEPC_BAU_GW_graphics_March21_dbqc_5._SY232_CB655805757_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Smartwatches & fitness trackers</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img21/PC/Computers/GW/DBQC/D21343116_IN_CEPC_BAU_GW_graphics_March21_dbqc_6._SY232_CB655805757_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Laptops</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img21/PC/Computers/GW/DBQC/D21343116_IN_CEPC_BAU_GW_graphics_March21_dbqc_6._SY232_CB655805757_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Tablets</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img21/PC/Computers/GW/DBQC/D21343116_IN_CEPC_BAU_GW_graphics_March21_dbqc_8._SY232_CB655805757_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Monitors</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">Explore all</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Bestselling Smartwatch starts at ₹1,999
                    </div>
                    <div class="inner-box-mid">
                        <a href="product.jsp"><img class="fullimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wearables/PC_CategoryCard_758X608_2._SY608_CB614835787_.jpg" alt=""></a>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">Shop now</a>
                    </div>
                </div>
                <div class="box-content">
                    <div class="inner-box-top">
                        Birthday store
                    </div>
                    <div class="inner-box-mid mid-fourimg">
                        <div class="twocol">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img class="leftimg" src="https://images-eu.ssl-images-amazon.com/images/G/31/img20/Events/GWBdaystore/Artboard_1QC2_2x._SY232_CB662999952_.jpg" alt="">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Gift for men</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img20/Events/GWBdaystore/Artboard_3QC2_2x._SY232_CB662999952_.jpg" alt="" class="leftimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Gift for boys</p></a>
                                </div>
                            </div>
                        </div>
                        <div class="two-col">
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img20/Events/GWBdaystore/Artboard_2QC2_2x._SY232_CB662999952_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Gift for women</p></a>
                                </div>
                            </div>
                            <div class="fourimg">
                                <div class="inner-fourimg">
                                    <a href="product.jsp">
                                        <img src="https://images-eu.ssl-images-amazon.com/images/G/31/img20/Events/GWBdaystore/Artboard_4QC2_2x._SY232_CB662999955_.jpg" alt="" class="rightimg">
                                    </a>
                                </div>
                                <div class="description-fourimg">
                                    <a class="nodeco" href="product.jsp"><p>Gift for girls</p></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="inner-box-bottom">
                        <a href="product.jsp">See all offers</a>
                    </div>
                </div>
            </div>   
        </div>
    </div>




    <footer>
        <div class="foot">
            <a href="#start" class="foot-link">
                <div class="upper-foot">
                    Back to top
                </div>
            </a>
            <div class="mid-foot">
                <table class="container foot-table">
                    <th>
                        Get to Know Us
                    </th>
                    <th>
                        Connect with Us
                    </th>
                    <th>
                        Make Money with Us
                    </th>
                    <th>
                        Let Us Help You
                    </th>
                    <tr>
                        <td><a class="foot-table-text" href="#">About Us</a></td>
                        <td><a class="foot-table-text" href="#">Facebook</a></td>
                        <td><a class="foot-table-text" href="#">Sell on Amazon</a></td>
                        <td><a class="foot-table-text" href="#">COVID-19 and Amazon</a></td>
                    </tr>
                    <tr>
                        <td><a class="foot-table-text" href="#">Careers</a></td>
                        <td><a class="foot-table-text" href="#">Twitter</a></td>
                        <td><a class="foot-table-text" href="#">Sell under Amazon Accelerator</a></td>
                        <td><a class="foot-table-text" href="#">Your Account</a></td>
                    </tr>
                    <tr>
                        <td><a class="foot-table-text" href="#">Press Releases</a></td>
                        <td><a class="foot-table-text" href="#">Instagram</a></td>
                        <td><a class="foot-table-text" href="#">Protect and Build Your Brand</a></td>
                        <td><a class="foot-table-text" href="#">Returns Centre</a></td>
                    </tr>
                    <tr>
                        <td><a class="foot-table-text" href="#">Amazon Science</a></td>
                        <td></td>
                        <td><a class="foot-table-text" href="#">Amazon Global Selling</a></td>
                        <td><a class="foot-table-text" href="#">100% Purchase Protection</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><a class="foot-table-text" href="#">Become an Affiliate</a></td>
                        <td><a class="foot-table-text" href="#">Amazon App Download</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><a class="foot-table-text" href="#">Fulfilment by Amazon</a></td>
                        <td><a class="foot-table-text" href="#">Help</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><a class="foot-table-text" href="#">Advertise Your Products</a></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><a class="foot-table-text" href="#">Amazon Pay on Merchants</a></td>
                        <td></td>
                    </tr>
                </table>
            </div>
            <div class="mid-foot2">
                <h1>Keep Shopping!</h1>
            </div>
            <div class="bottom-foot">&copy; Swarnadeep Das, Ranadeep Sen, Sraban Kumar Dolai, Soumadip Panda, Narugopal Adhikari, 2024
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>