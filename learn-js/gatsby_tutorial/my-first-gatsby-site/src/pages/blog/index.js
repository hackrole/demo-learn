import * as React from 'react';
import Layout from '../../components/layout.js';
import { graphql, Link } from 'gatsby';
import Seo from '../../components/seo.js';

const BlogPage = ({data})=> {
  return (
    <Layout pageTitle="My Blog Posts">
      <p>My Cool posts will go in here</p>
      <ul>
        {
          data.allMdx.nodes.map(node => (
            <article key={node.id}>
              <h2>
                <Link to={`/blog/${node.frontmatter.slug}`}>
                  {node.frontmatter.title}
                </Link>
              </h2>
              <p>Posted: {node.frontmatter.date}</p>
              <p>{node.excerpt}</p>
            </article>
          ))
        }
      </ul>
    </Layout>
  );
}

export const query = graphql`
  query {
    allMdx(sort: {fields: frontmatter___date, order:DESC}){
      nodes {
        frontmatter {
          date(formatString: "MMMM D, YYYY")
          title
          slug
        }
        id
        excerpt
      }
    }
  }
`

export const Head = () => <Seo title="My Blog Page"/>

export default BlogPage
