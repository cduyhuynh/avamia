import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Layout from 'components/Layout';
import Feed from 'components/Feed';

export default (
  <Router>
    <Routes>
      <Route path='/' exact element=<Layout content={<Feed />}/> />
    </Routes>
  </Router>
);