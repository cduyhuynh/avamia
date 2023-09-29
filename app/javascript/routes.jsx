import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Layout from 'components/Layout';

export default (
  <Router>
    <Routes>
      <Route path='/' exact element=<Layout/> />
    </Routes>
  </Router>
);