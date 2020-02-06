import convert from 'xml-js';
import lo from 'lodash';
import fs from 'fs';

convertModel('iSisSales');
convertModel('iSisDriver');
convertModel('iSisWarehouse');
convertModel('vfs');

function convertModel(name) {

  const xml = fs.readFileSync(`./models/${name}.xcdatamodel/contents`, 'utf8');

  const options = {
    ignoreComment: true,
    alwaysArray: ['attribute', 'entity', 'relationship'],
    compact: true,
    ignoreDeclaration: true,
  };

  const parsed = convert.xml2js(xml, options);

  const { model: { _attributes: attributes, entity } } = parsed;

  const result = {
    model: {
      ...attributes,
      entity: mapEntity(entity),
    },
  };

  console.log(name, 'entity count:', result.model.entity.length);

  fs.writeFileSync(`./dist/${name}.json`, JSON.stringify(result, null, 2));

}

function mapEntity(entities) {
  return lo.map(entities, ({ relationship, attribute, _attributes }) => {
    const res = {
      ..._attributes,
      attribute: lo.map(attribute, objAttributes),
      relationship: lo.map(relationship, objAttributes),
    };
    if (!res.attribute.length) {
      delete res.attribute;
    }
    if (!res.relationship.length) {
      delete res.relationship;
    }
    return res;
  });
}

function objAttributes(obj) {
  return lo.omit({ ...obj, ...obj._attributes }, ['_attributes']);
}
