/* eslint-env mocha */

import assert from 'assert';
import { mount } from 'enzyme';
import React from 'react';
import App from '../../components/App';

describe('<App />', () => {
  it('should render correctly', () => {
    const wrapper = mount(<App />);
    assert(wrapper.contains('Tell us what you think'));

    assert.strictEqual(wrapper.find('Header').length, 1);
    assert.strictEqual(wrapper.find('Form').length, 1);
    assert.strictEqual(wrapper.find('Footer').length, 1);

    assert.strictEqual(wrapper.find('Header').prop('title'), 'Tell us what you think');
    assert.strictEqual(wrapper.find('Footer').prop('text'), 'Copyright: Appfolio Inc. Onboarding');
  });
});
