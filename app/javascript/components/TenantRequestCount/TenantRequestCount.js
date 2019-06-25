import React from "react";
import PropTypes from "prop-types";
import styles from "./TenantRequestCount.module.css";

const TenantRequestCount = ({tenantName, requestCount}) => {

  return (
    <div className={styles.tenantRequestCount}>
      <span className={styles.field}>{tenantName}</span>
      <span className={styles.field}>{requestCount}</span>
    </div>
  );
};

TenantRequestCount.propTypes = {
  tenantName: PropTypes.string.isRequired,
  requestCount: PropTypes.number,
};

TenantRequestCount.defaultProps = {
  requestCount: 0,
};

export default TenantRequestCount;
