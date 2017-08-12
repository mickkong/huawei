$.ajaxSetup({
	contentType : "application/x-www-form-urlencoded; charset=utf-8",
	async : false
});

// 商品名选择触发事件
$("#findByName option").bind("click", function() {
	var name = $(this).val();
	getCodeInf(name);
	window.location.reload();
});

function getCommAry() {
	return getCodeInf("荣耀畅玩6x")[2];
}

function getD() {
	var arrays = new Array();
	var sa = getCodeInf("荣耀畅玩6x")[1];
	for ( var i = 0; i < sa.length; i++) {
		arrays[i] = {
			text : sa[i],
			max : 100
		};
	}
	return arrays;

}

// 取得所有信息数组
function getCodeInf(name) {
	// 商品编码数组
	var proCodes = [];
	// 商品描述数组
	var proDet = [];
	// 销售好评度数组
	var proCommOne = [];

	$.get("admin?type=showReport&show=codeDet&name=" + name + "",
			function(data) {
				var codeList = $.parseJSON(data);
				for ( var i = 0; i < codeList.length; i++) {
					var codeOne = codeList[i];
					proCodes.push(codeOne.proCode);
					proDet.push(codeOne.proDet);
					proCommOne.push(codeOne.codeComm * 100);
				}
			});
	var all = [];
	all.push(proCodes, proDet, proCommOne);
	return all;
}

// 月份选择触发事件
$("#findByDate option").bind("click", function() {
	alert(dateT);
	dateT = $(this).val();
	window.location.reload();
	getDataAll(dateT);
});

var dateT = 0;

function getNames() {
	return getDataAll(dateT)[0];
}
function getSales() {
	return getDataAll(dateT)[1];
}
function getNums() {
	return getDataAll(dateT)[2];
}
function getComms() {
	return getDataAll(dateT)[3];
}

function getAllMoney() {

	var arr = getSales();
	var result = 0;
	for ( var i = 0; i < arr.length; i++) {
		result += arr[i];
	}
	return "￥  " + result;
}

function getSalesName() {
	var arrays = new Array();
	var sa = getSales();
	var sn = getNames();
	for ( var i = 0; i < sa.length; i++) {
		arrays[i] = {
			value : sa[i],
			name : sn[i]
		};
	}
	return arrays;
}

// 取得所有信息数组
function getDataAll(date) {
	// 商品名数组
	var proNames = [];
	// 销量额数组
	var proSales = [];
	// 销售销售量数组
	var proNums = [];
	// 销售好评度数组
	var proComms = [];

	$.post("admin?type=showReport&show=allJson&date=" + date + "", function(
			data) {
		var proList = $.parseJSON(data);
		for ( var i = 0; i < proList.length; i++) {
			var proOne = proList[i];
			proNames.push(proOne.proName);
			proSales.push(proOne.proSales);
			proNums.push(proOne.proNum);
			proComms.push(proOne.proComm * 100);
		}
	});
	var all = [];
	all.push(proNames, proSales, proNums, proComms);
	return all;
}

var myChart = echarts.init(document.getElementById('main'));
myChart.setOption({
	title : {
		text : '销售情况',
	},
	tooltip : {
		trigger : 'axis'
	},
	legend : {
		data : [ '销售量', '好评度  %' ]
	},
	toolbox : {
		show : true,
		feature : {
			mark : {
				show : true
			},
			dataView : {
				show : true,
				readOnly : false
			},
			magicType : {
				show : true,
				type : [ 'line', 'bar' ]
			},
			restore : {
				show : true
			},
			saveAsImage : {
				show : true
			}
		}
	},
	calculable : true,
	xAxis : [ {
		type : 'category',
		data : getNames()
	} ],
	yAxis : [ {
		type : 'value'
	} ],
	series : [ {
		name : '销售量',
		type : 'bar',
		data : getNums(),
		markPoint : {
			data : [ {
				type : 'max',
				name : '最大值'
			}, {
				type : 'min',
				name : '最小值'
			} ]
		},
		markLine : {
			data : [ {
				type : 'average',
				name : '平均值'
			} ]
		}
	}, {
		name : '好评度 %',
		type : 'bar',
		data : getComms(),
		markPoint : {
			data : [ {
				type : 'max',
				name : '最大值'

			}, {
				type : 'min',
				name : '最小值'
			} ]
		},
		markLine : {
			data : [ {
				type : 'average',
				name : '平均值'
			} ]
		}
	} ]
});

var myChart1 = echarts.init(document.getElementById('main1'));
option = {
	title : {
		text : '商品销售总额 ',
		subtext : getAllMoney(),
		x : 'center'
	},
	tooltip : {
		trigger : 'item',
		formatter : "{a} <br/>{b} : {c} ({d}%)"
	},
	legend : {
		orient : 'vertical',
		x : 'left',
		data : getNames()
	},
	toolbox : {
		show : true,
		feature : {
			mark : {
				show : true
			},
			dataView : {
				show : true,
				readOnly : false
			},
			magicType : {
				show : true,
				type : [ 'pie', 'funnel' ],
				option : {
					funnel : {
						x : '25%',
						width : '50%',
						funnelAlign : 'left',
						max : 1548
					}
				}
			},
			restore : {
				show : true
			},
			saveAsImage : {
				show : true
			}
		}
	},
	calculable : true,
	series : [ {
		name : '商品销售额',
		type : 'pie',
		radius : '55%',
		center : [ '50%', '60%' ],
		data : getSalesName()
	} ]
};
myChart1.setOption(option);

var myChart2 = echarts.init(document.getElementById('main2'));
option = {
	title : {
		text : ' 商品名',
		subtext : '  商品详细'
	},
	tooltip : {
		trigger : 'axis'
	},
	legend : {
		x : 'center',
		data : [ '商品明细' ]
	},
	toolbox : {
		show : true,
		feature : {
			mark : {
				show : true
			},
			dataView : {
				show : true,
				readOnly : false
			},
			restore : {
				show : true
			},
			saveAsImage : {
				show : true
			}
		}
	},
	calculable : true,
	polar : [ {
		indicator : getD(),
		radius : 130
	} ],
	series : [ {
		name : '商品描述',
		type : 'radar',
		itemStyle : {
			normal : {
				areaStyle : {
					type : 'default'
				}
			}
		},
		data : [ {
			value : getCommAry(),
			name : '好评度'
		} ]
	} ]
};
myChart2.setOption(option);