import React from 'react';
import { Layout, notification } from 'antd';

const { Content, Footer } = Layout;

export default function({content}) {
  return (
    <Layout>
      <Content>
        {content}
      </Content>
    </Layout>
)};