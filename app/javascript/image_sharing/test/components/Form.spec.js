/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import Form from '../../components/Form';

describe('<Form />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<Form />);
    const form = wrapper.find('form');
    assert.strictEqual(form.length, 1);

    const labels = form.find('label');
    assert.strictEqual(labels.length, 2);
    assert.strictEqual(labels.at(0).text(), 'Your Name:');
    assert.strictEqual(labels.at(1).text(), 'Comments:');

    const fields = form.find('input');
    assert.strictEqual(fields.length, 3);

    assert.strictEqual(fields.at(0).prop('name'), 'name');
    assert.strictEqual(fields.at(1).prop('name'), 'comments');
    assert.strictEqual(fields.at(2).prop('type'), 'submit');

    assert.strictEqual(fields.at(0).text(), '');
    assert.strictEqual(fields.at(1).text(), '');
    assert.strictEqual(fields.at(2).prop('value'), 'Submit');
  });
});