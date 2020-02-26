import "bootstrap";

import { updateNavbarOnScroll } from '../components/navbar';
import { bannerCarousel } from '../components/banner';
import { changeActiveTab } from '../components/dashboard';

updateNavbarOnScroll();

bannerCarousel();

changeActiveTab();
