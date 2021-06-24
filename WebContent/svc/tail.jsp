</div>

<script>
  $(document).ready(function() {
       $("input:checkbox").on('click', function() { 
           if ( $(this).prop('checked') ) {
              $('#sidebar').addClass('active');
             // $('.overlay').fadeIn();
              $('#main').css("margin-left","300px"); 
          } else {
              $('#sidebar').removeClass('active');
             // $('.overlay').fadeOut();
              $('#main').css("margin-left","70px");
          } 
      }); 
  });

 
</script>

</body>
</html>