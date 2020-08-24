window.addEventListener("load", function(){
  const slide = document.getElementsByClassName("slide")
for(i=0; i<slide.length; i++){
slide.slick({
    accessibility: true,
    autoplay: true,
    autoplaySpeed: 1000,
    dots: true,
    fade: true,
  });
}
});