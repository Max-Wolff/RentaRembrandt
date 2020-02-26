import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { updateNavbarOnScroll } from '../components/navbar';
import { bannerCarousel } from '../components/banner';
import { changeActiveTab } from '../components/dashboard';
import { initMapbox } from '../plugins/init_mapbox';


updateNavbarOnScroll();

bannerCarousel();

changeActiveTab();

initMapbox();
