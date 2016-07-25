$(function() {
	$("button#add_selected_category").on("click", function(){
		var selectCategory = $(this).prev("select").val();

		if (selectCategory) {
			var $textCategory      = $(this).prevAll("input#text_category");
			var selectedCategory   = $textCategory.val();
			var selectedCategories = selectedCategory.split(",");

			if ($.inArray(selectCategory, selectedCategories) < 0) {
				var addedCategory = selectedCategory ? selectedCategory + "," + selectCategory : selectCategory;

				$textCategory.val(addedCategory);
			}
		}
	});
});