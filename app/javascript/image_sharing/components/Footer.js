import React from 'react';
import PropTypes from 'prop-types';

export default function Footer(props) {
  return (
    <p className='text-center'>{props.text}</p>
  );
}

Footer.propTypes = {
  text: PropTypes.string.isRequired
};

