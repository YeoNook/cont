<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="C:\20211022\Cafe.css">
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <title>Coffee&Beverage</title>
</head>
<style>
body {
   background-image:
      url(https://blog.kakaocdn.net/dn/crCkFo/btqEG8ENOts/q0cIVJ50oFJDjGk3iAcn6k/img.jpg);
   background-size: 1920px 1080px;	
   background-repeat: no-repeat;
}


table.bound { /*bound라는 class는 table 안에서만 쓸 수 있다.*/
    border-collapse: collapse;
/*     background-image :url(https://search.pstatic.net/common/?src=https%3A%2F%2Fg-grafolio.pstatic.net%2F20161220_16%2F1482240092618n5pcD_JPEG%2Fimage.jpg%3Ftype%3Dw896_4&type=sc960_832); */
    font-family:Segoe Script;
    color : black;
    border:1px solid black;
    width:260px;
}
 #selOrder{
    height:350px;
    }  
#dlgMenu2,#dlgMenu{
/* background-image :url(https://i.pinimg.com/originals/4c/96/9d/4c969d99ea3a2eec71c07c3f18709965.png) */
} 
#btnCancel{
   
    font-family:Segoe Print;
}
#selMenu1{
/*     background-image: linear-gradient(120deg, #3498db, #8e44ad); */
}
h2,#btnMenu,#selMenu2,#selMenu3,#btnPlus,#btnMinus,#btnAdd,#btnReset,#summary,#btnDone,#dlgMenu2,#price1,#code,#menuname,#count1,#total{
    
    font-family:Segoe Print;
    
}
td.bound { /*이 bound는 td 안에서는 아래의 의미가 된다.*/
    border:1px solid rgb(51, 51, 170);
}
#selMenu,#selOrder,#selSales,#selMenu1 {
    width: 260px;
    font-family:Segoe Script;
    color : black;
    font-size : 13px;
/*     background-image: url(https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20130507_264%2Fsmiso1104_13679312752744wCl9_JPEG%2F%25B0%25ED%25BE%25E7%25C0%25CC.jpg&type=sc960_832); */
    background-size: 250px;
    
}
</style>
<body>
<header><h2 align=center>Choo Cafe</h2>
<hr></header>
    <table  align=center>
        <tr>
            <td valign=top>
                <table class='bound'>
                    <caption>MenuList</caption>
                    <tr>
                        <td colspan=2 align=right>
                        <button id=btnMenu>Management</button>
                        </td>
                    </tr>
                <tr>
                    <td colspan=2>
                        <select id=selMenu size=13></select>
                    </td>
                </tr>
                     <tr>
                    <td>Code</td>
                    <td><input type=text id=m_code readonly></td>
                </tr>
     
                <tr>
                    <td>MenuName</td>
                    <td><input type=text id=menuname readonly></td>
                </tr>
                <tr>
                    <td>Count</td>
                    <td><input type=number id=count1 min=0 style='width:30px'>잔</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type=number id=price1 value=0 readonly>Won</td>
                </tr>
                <tr>
                    <td><button id=btnReset>Reset</button></td>
                    <td align=right><button id=btnAdd>Menu add</button></td>
                </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound' id=tbl2>
                    <caption>OrderList</caption>
                    <tr>
                        <td colspan=2 id=td2>
                            <select id=selOrder size=13></select>
                        </td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><input type=number id=total style='width:100px'>Won</td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><input type=phone id=mobile size=13></td>
                    </tr>
                    <tr>
                        <td colspan=2>&nbsp;</td>
                    </tr>
                    <tr>
                        <td><button id=btnCancel>Order Cancel</button></td>
                        <td align=right><button id=btnDone>Order Complete</button></td>
                    </tr>
                </table>
            </td>
            <td valign=top>
                <table class='bound'>
                    <caption>Sale Daily</caption>
                    <tr>
                  <td colspan=2 align=right>
                     <button id=summary>Summary</button>
                  </td>
               </tr>
                    <tr>
                        <td>
                            <select id=selSales size=20></select>
                        </td>
                    </tr>
                    
                </table>
            </td>
        </tr>
    </table>
    <div id=dlgMenu id=btnMenu style='display:none;' title="메뉴관리">
        <table>
            <tr>
                <td>
                    <select id=selMenu1 size=10></select>
                </td>
                <td>
                    <table>
                    <tr>
                        <td>코드</td><td><input type=text id=code style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>메뉴명</td><td><input type=text id=name style='width:120px'></td>
                    </tr>
                    <tr>
                        <td>단가(가격)</td><td><input type=number id=price min=0 step=500 style='width:50px'>원</td>
                    </tr>
                    <tr>
                        <td colspan=2 align=center><button id=btnPlus>Complete</button>&nbsp;
                        </td>
                    </tr>
                    </table>
                </td>
            </tr>    
            </table>
    </div>
<div id=dlgMenu2 style='display: none;' title="Summary"> 
      <table>
         <tr>
            <td><select id=selMenu2 size=10></select></td>
            <td><select id=selMenu3 size=10></select></td>
            </tr>
      </table>
   </div>
</body>
<script src='https://code.jquery.com/jquery-3.5.0.js'></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
<script>
// 1
let nTotal=0;
$(document)
.ready(function(){
   loadRoom();
   loadselsales();
   })
    .on('click','#selMenu',function(){
        str=$('#selMenu option:selected').text();
        let ar=str.split(' ');
        $('#m_code').val(ar[0]);
        $('#menuname').val(ar[1]);
        $('#count1').val(1);
        $('#price1').val(ar[2]*$('#count1').val());
    })
    .on('change','#count1',function(){
        str=$('#selMenu option:selected').text();
        let ar=str.split(' ');
        ar[2]=parseInt(ar[2]);
        bb=$('#count1').val();
        $('#price1').val(ar[2]*bb);
    })
  
  //↑메뉴 목록에서 메뉴를 클릭하면 아래에 나오게 실행
 
 .on('click','#btnReset',function(){
        $('#menuname').val('')
        $('#price1').val('')
        $('#count1').val('')
    })
    .on('click','#btnAdd',function(){
        nam=$('#menuname').val();
        cou=$('#count1').val();
        pric=$('#price1').val();
        pric=parseInt(pric);
        sel=$("#selMenu option:selected").text();
        let ar = sel.split(' ');
        strOrder='<option>'+ar[0]+' '+nam+' '+cou+' '+pric+'</option>'
        $('#selOrder').append(strOrder);
        nTotal+=pric
        $("#total").val(nTotal)  
        $('#btnReset').trigger('click')
    })
    
  .on("click",'#btnCancel',function(){
        $('#selOrder').empty()
        nTotal=0;
        $("#total").val(nTotal)
        $("#mobile").val('')
    })//↑메뉴 목록에서 삭제코드 ,메뉴 전송 코드.
    
    
    .on('click','#btnDone',function(){
    	if($('#mobile').val()=='') $('#mobile').val('--');
    	$('#selOrder option').each(function(){
    	   let a=$(this).text();
    	   let rec=a.split(' ');
    	   menu_code = rec[0];
    	   mobile = $('#mobile').val();
    	   Menu = rec[1];
    	   qty = rec[2];
    	   total = rec[3];
    	   str='<option>'+' '+menu_code+' '+Menu+' '+qty+' '+mobile+' '+total+'</option>'
    	   $('#selSales').append(str);
    	$.get('Cafe_sales_Insert',{
    	  mobile:mobile,
    	  menu_code:menu_code,
    	  menu:Menu,
	      qty:qty,
	      total:total
    	},function(txt){
    	   $('#mobile,#code,#count1,#total').val("");
    	},'text');
    	
    	})

    	$('#total').val('');
    	$('#selOrder').empty();
    	})     //↑ 주문내역 취소 주문내역 결제

    
    
    //↓CRUD

.on('click','#btnMenu',function(){ 
        $('#dlgMenu').dialog({
        width:560,
        open:function(){ 
           $.get('select',{},function(txt){
              if (txt == "")
                 return false;
              let rec = txt.split(';');
              for (i = 0; i < rec.length; i++) {
                 let fld = rec[i].split(',');
                 html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
                 $('#selMenu1').append(html);
              }
           })
        },
        close:function(){
           $('#selMenu').empty();
           $('#selMenu1').empty();
           loadRoom();
        }
        });
    })
   .on('click','#btnPlus',function() {
      $('#selMenu1').empty();
            let operation = '';
            if ($('#code').val() == '') {
               if ($('#name').val() != '' && $('#price').val() != '') {
                  operation = "insert";
               } else {
                  alert('입력값이 모두 채워지지 않았습니다.');
                  return false;
               }
            } else {
               if ($('#name').val() != '' && $('#price').val() != '') {
                  operation = "update";
               } else {
                  operation = "delete";
               }
            }
            $.get(operation, {
               code : $('#code').val(),
               name : $('#name').val(),
               price : $('#price').val(),
            }, function(txt) {
               $('#code,#name,price').val("");
               $.get('select',{},function(txt){
                  if (txt == "")
                     return false;
                  let rec = txt.split(';');
                  for (i = 0; i < rec.length; i++) {
                     let fld = rec[i].split(',');
                     html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
                     $('#selMenu1').append(html);
                  }
               })
            }, 'text');
               $('#code').val('');
               $('#name').val('');
               $('#price').val('');
            return false;
         })

// ---

.on('click','#summary',function(){ 
        $('#dlgMenu2').dialog({
        	width:560,
        open:function(){
        	$('#selMenu2').empty();
        	$('#selMenu3').empty();
           $.get('Cafe_sales_select',{},function(txt){
              if (txt=="")return false;
              let rec = txt.split(';');
              for (i = 0; i < rec.length; i++) {
                 let fld = rec[i].split(',');
                 html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
                 $('#selMenu2').append(html);
              }
           })
              $.get('Cafe_sales_select2',{},function(txt){
              if (txt=="")return false;
              let rec = txt.split(';');
              for (i = 0; i < rec.length; i++) {
                 let fld = rec[i].split(',');
                 html = '<option>'+fld[0]+' '+fld[1]+'</option>';
                 $('#selMenu3').append(html);
              }
           })
        },
        close:function(){
           $('#selMenu2').empty();
           $('#selMenu3').empty();
        }
        });
    })

///=---

function loadRoom(){
   $.get('select',{},function(txt){
      if (txt == "") return false;
      let rec = txt.split(';');
      for (i = 0; i < rec.length; i++) {
         let fld = rec[i].split(',');
         html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
         $('#selMenu').append(html);
      }
   })
}


function loadsel(){
	$.get('select',{},function(txt){
		if(txt=="")	return false;
	      let rec = txt.split(';');
	      for (i = 0; i < rec.length; i++) {
	         let fld = rec[i].split(',');
	         html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+'</option>';
	         $('#selSales,#selMenu1').append(html);
	      }
	   })
	} 
function loadselsales(){
	   $.get('Cafe_sales_select3',{},function(txt){
	      if (txt == "") return false;
	      let rec = txt.split(';');
	      for (i = 0; i < rec.length; i++) {
	         let fld = rec[i].split(',');
	         html = '<option>'+fld[0]+' '+fld[1]+' '+fld[2]+' ' +fld[3]+' '+fld[4]+'</option>';
	         $('#selSales').append(html);
	         console.log(html);
	      }
	   } ,"text")
}
</script>
</html>