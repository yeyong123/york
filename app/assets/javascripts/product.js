/**
 *  * linkSelet jQuery Plug-in
 *   */
$.fn.linkSelect = function (num){
	if (!num) num = 1;
	var all_select = document.getElementsByTagName('select');
	this.each(function(i){
		new linkSelect(this, all_select, num);
	});
	all_select = null;

	function linkSelect(obj, all_select, num){
		var obj1_index = 0;
		for (i =0; i < all_select.length; i++){
			if (all_select[i] == obj){
				obj1_index = i;
			}
		}
		obj1_index = (obj1_index - num) > -1 ? obj1_index - num : 0;
		this.obj1 = $(all_select[obj1_index]);
		this.obj2 = $(obj);
		var obj3 = $('<select disabled="disabled">' + this.obj2.html() + '</select>');
		this.elems = obj3[0].getElementsByTagName('optgroup');
		this.obj2.html(this.obj2.get(0).options[this.obj2.get(0).selectedIndex].parentNode.innerHTML);  
		var self = this;
		this.obj1.change(function(){
			self.obj2.html('');
			for (var i = 0; i < self.elems.length; i++){
				if (self.elems[i].label == this.value){
					self.obj2.html(self.elems[i].innerHTML);
					self.obj2.change();
				}
			}
		});  
	}
}
