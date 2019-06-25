import React from "react";
import PropTypes from "prop-types";
import CountCard from "./CountCard/CountCard.js";
import CountCardLayout from "./CountCardLayout/CountCardLayout.js";
import TenantRequestCount from "./TenantRequestCount/TenantRequestCount.js";
import styles from "./App.module.css";

class App extends React.Component {
  render () {
    const { answer_count, question_count, user_count, tenant_requests } = this.props;

    const tenantRequestCounts = tenant_requests.map(({ tenantName, requestCount }) => (
      <div className={styles.tenantRequestCountsWrapper}>
        <TenantRequestCount tenantName={tenantName} requestCount={requestCount} />
      </div>
    ));

    return (
      <div className={styles.app}>
        <h1>Database Information</h1>
        <CountCardLayout>
          <CountCard title='Question Count' count={question_count} />
          <CountCard title='Answer Count' count={answer_count} />
          <CountCard title='User Count' count={user_count} />
        </CountCardLayout>
        <h1>API Requests Per Tenant</h1>
        {tenantRequestCounts}
      </div>
    );
  }
}

App.propTypes = {
  answer_count: PropTypes.number,
  question_count: PropTypes.number,
  user_count: PropTypes.number,
  tenant_requests: PropTypes.arrayOf(
    PropTypes.shape({
      tenantName: PropTypes.string.isRequired,
      requestCount: PropTypes.number.isRequired,
    })
  ).isRequired,
};

App.defaultProps = {
  answer_count: 0,
  question_count: 0,
  user_count: 0,
};

export default App;
