function createInputHtml(id){
  return 'Title: <input type="text" name="album[songs_attributes]['+id+'][title]" id="album_songs_attributes_'+id+'_title" /> Artist: <input type="text" name="album[songs_attributes]['+id+'][artist_attributes][name]" id="album_songs_attributes_'+id+'_artist_attributes_name" /><br><br>';
}

function createInputsHtml(length) {
  var returnString='';
  for(var id=0; id<=length-1; id++){
    returnString+=createInputHtml(id);
  }
  return returnString;
}

function bindElements(){
  console.log("elements have been bound!");
  $('#songCount').click(function(event){
    event.preventDefault();
    var songCount = parseInt( $('#songCount').val() );
    var inputHtml = createInputsHtml(songCount);
    console.log(inputHtml);
    $('#songInputs').html(inputHtml);
  });
}

var initPage = function(){
  bindElements();
}

$( document ).ready(initPage);

$(document).on('page:load', initPage)