function openNav() {
    const mySidenav = document.getElementById('mySidenav');
    if (mySidenav.style.width === '250px') {
      mySidenav.style.width = '0';
    } else {
      mySidenav.style.width = '250px';
    }
  }