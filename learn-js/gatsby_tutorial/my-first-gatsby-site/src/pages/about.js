import * as React from 'react'
import Layout from '../components/layout.js'
import Seo from '../components/seo.js';

const AboutPage = () => {
  return (
    <Layout pageTitle="About me">
      <p>Hi there! I'm the proud author of this site.</p>
    </Layout>
  )
}

export const Head = () => <Seo title="about page"/>

export default AboutPage
