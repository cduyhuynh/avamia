import React from 'react';
import { Layout, notification } from 'antd';
import Header from './Header';

const { Content, Footer } = Layout;

export default function({content}) {
  return (
    <Layout>
      <Header />
      <Content>
        {content}
      </Content>
    </Layout>
)};