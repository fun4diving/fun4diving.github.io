export function gql(strings, ...args) {
  let str = "";
  strings.forEach((string, i) => {
    str += string + (args[i] || "");
  });
  return str;
}
export const NewsPartsFragmentDoc = gql`
    fragment NewsParts on News {
  __typename
  title
  date
  image
  summary
  body
}
    `;
export const CoursesPartsFragmentDoc = gql`
    fragment CoursesParts on Courses {
  __typename
  title
  price
  image
  description
  body
}
    `;
export const NewsDocument = gql`
    query news($relativePath: String!) {
  news(relativePath: $relativePath) {
    ... on Document {
      _sys {
        filename
        basename
        hasReferences
        breadcrumbs
        path
        relativePath
        extension
      }
      id
    }
    ...NewsParts
  }
}
    ${NewsPartsFragmentDoc}`;
export const NewsConnectionDocument = gql`
    query newsConnection($before: String, $after: String, $first: Float, $last: Float, $sort: String, $filter: NewsFilter) {
  newsConnection(
    before: $before
    after: $after
    first: $first
    last: $last
    sort: $sort
    filter: $filter
  ) {
    pageInfo {
      hasPreviousPage
      hasNextPage
      startCursor
      endCursor
    }
    totalCount
    edges {
      cursor
      node {
        ... on Document {
          _sys {
            filename
            basename
            hasReferences
            breadcrumbs
            path
            relativePath
            extension
          }
          id
        }
        ...NewsParts
      }
    }
  }
}
    ${NewsPartsFragmentDoc}`;
export const CoursesDocument = gql`
    query courses($relativePath: String!) {
  courses(relativePath: $relativePath) {
    ... on Document {
      _sys {
        filename
        basename
        hasReferences
        breadcrumbs
        path
        relativePath
        extension
      }
      id
    }
    ...CoursesParts
  }
}
    ${CoursesPartsFragmentDoc}`;
export const CoursesConnectionDocument = gql`
    query coursesConnection($before: String, $after: String, $first: Float, $last: Float, $sort: String, $filter: CoursesFilter) {
  coursesConnection(
    before: $before
    after: $after
    first: $first
    last: $last
    sort: $sort
    filter: $filter
  ) {
    pageInfo {
      hasPreviousPage
      hasNextPage
      startCursor
      endCursor
    }
    totalCount
    edges {
      cursor
      node {
        ... on Document {
          _sys {
            filename
            basename
            hasReferences
            breadcrumbs
            path
            relativePath
            extension
          }
          id
        }
        ...CoursesParts
      }
    }
  }
}
    ${CoursesPartsFragmentDoc}`;
export function getSdk(requester) {
  return {
    news(variables, options) {
      return requester(NewsDocument, variables, options);
    },
    newsConnection(variables, options) {
      return requester(NewsConnectionDocument, variables, options);
    },
    courses(variables, options) {
      return requester(CoursesDocument, variables, options);
    },
    coursesConnection(variables, options) {
      return requester(CoursesConnectionDocument, variables, options);
    }
  };
}
import { createClient } from "tinacms/dist/client";
const generateRequester = (client) => {
  const requester = async (doc, vars, options) => {
    let url = client.apiUrl;
    if (options?.branch) {
      const index = client.apiUrl.lastIndexOf("/");
      url = client.apiUrl.substring(0, index + 1) + options.branch;
    }
    const data = await client.request({
      query: doc,
      variables: vars,
      url
    }, options);
    return { data: data?.data, errors: data?.errors, query: doc, variables: vars || {} };
  };
  return requester;
};
export const ExperimentalGetTinaClient = () => getSdk(
  generateRequester(
    createClient({
      url: "http://localhost:4001/graphql",
      queries
    })
  )
);
export const queries = (client) => {
  const requester = generateRequester(client);
  return getSdk(requester);
};
