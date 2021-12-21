

window.addEventListener('DOMContentLoaded', event => {

    // Navbar shrink function
    var navbarShrink = function () {
        const navbarCollapsible = document.body.querySelector('#mainNav');
        if (!navbarCollapsible) {
            return;
        }
        if (window.scrollY === 0) {
            navbarCollapsible.classList.remove('navbar-shrink')
        } else {
            navbarCollapsible.classList.add('navbar-shrink')
        }

    };

    // Shrink the navbar 
    navbarShrink();

    // Shrink the navbar when page is scrolled
    document.addEventListener('scroll', navbarShrink);

    // Activate Bootstrap scrollspy on the main nav element
    const mainNav = document.body.querySelector('#mainNav');
    if (mainNav) {
        new bootstrap.ScrollSpy(document.body, {
            target: '#mainNav',
            offset: 74,
        });
    };

    // Collapse responsive navbar when toggler is visible
    const navbarToggler = document.body.querySelector('.navbar-toggler');
    const responsiveNavItems = [].slice.call(
        document.querySelectorAll('#navbarResponsive .nav-link')
    );
    responsiveNavItems.map(function (responsiveNavItem) {
        responsiveNavItem.addEventListener('click', () => {
            if (window.getComputedStyle(navbarToggler).display !== 'none') {
                navbarToggler.click();
            }
        });
    });

    // Activate SimpleLightbox plugin for portfolio items
    new SimpleLightbox({
        elements: '#portfolio a.portfolio-box'
    });

});

function w3_open() {
    	  
    	  document.getElementById("main").style.marginLeft = "0%";
    	  document.getElementById("mySidebar").style.width = "20%";
    	  document.getElementById("mySidebar").style.display = "block";
    	  document.getElementById("mySidebar").style.backgroundColor = "rgba(255,255,255,0.7)";
    	  document.getElementById("openNav").style.display = 'inline-block';    	  
    	  document.getElementById("openNav").style.color = 'transparent';    	  
    	  document.getElementById("myOverlay").style.display = "block";
    	  
    	 
    	}
    	
    	
    	  
    	function w3_close() {
    	  document.getElementById("main").style.marginLeft = "0%";
    	  document.getElementById("mySidebar").style.display = "none";
    	  document.getElementById("openNav").style.display = "inline-block";
    	  document.getElementById("myOverlay").style.display = "none";
    	  document.getElementById("openNav").style.color = 'rgba(0, 0, 0, 0.55)'; 
    	 
    	}


